function recordTTLs(eventName, eventData)
%ScanImage 3.8 user function
%adapted from hantman_stimPulse

dbstop if error %ignored?

persistent hDin hSys ttlChans

global state

numLines = 2;

switch eventName
    
    case 'acquisitionStarting'
        
        if isempty(hSys)
            hSys = dabs.ni.daqmx.System();
        end
        
        if isempty(hDin) || ~isvalid(hDin)
            taskName = 'TTLrec';
            if hSys.taskMap.isKey(taskName) %This shouldn't happen in usual operation
                delete(hSys.taskMap(taskName));
            end
            hDin = dabs.ni.daqmx.Task(taskName);
            
            % Dev1 PCI-6110 (s series, PMT inputs, mirror + shutter outputs) has 8 DIO (software timed)
            % Dev2 PCIe-6321 (x series, pockels output) has 24 DIO (8 hardware-timed up to 1 MHz -- port0 hardware timed, ports1-2 PFI-able)
            ttlChans = hDin.createDIChan('Dev2',['port0/line0:' num2str(numLines-1)],'ttlFramePhase','DAQmx_Val_ChanForAllLines');
            
            hz = 10000; %frame pulses definitely > 100us
            mins = .5; %?
            
            % how make sure we get hardware timed?  and same clock as PMT scans?
            
            source = state.init.hAI.sampClkSrc; % /Dev1/ai/SampleClockTimebase
            hDin.cfgSampClkTiming(hz, 'DAQmx_Val_ContSamps', round(hz * 60 * mins)); % , source);
            
            hDin.cfgDigEdgeStartTrig(state.init.triggerInputTerminal); %PFI0
        end
        
        if ~hDin.isTaskDone()
            fprintf(2,['WARNING: ' taskName ' Task was found to be active already.\n']);
            hDin.stop();
        end
        
        hDin.start();
        
    case {'acquisitionDone' 'abortAcquisitionEnd'}
        
        eventName
        
        try
            uints = 2.^(3:5);
            u = find(numLines <= uints,1,'first');
            bits = uints(u);
            if isempty(u)
                type = 'logical';
            else
                type = ['uint' num2str(bits)];
            end
            
            % logical doesn't work -- we get uint8's.  unit8 doesn't work, we get uint16's!
            [outputData, sampsPerChanRead] = readDigitalData(hDin, inf, type);
            % if logical: (will be 1 byte/sample/line -- uints pack them better)
            % columns = channels
            % rows = samples * lines
            
            if strcmp(type,'uint8') && isa(outputData,'uint16')
                % for now, pass
            elseif ~isa(outputData,type)
                class(outputData)
                error('huh?')
            end
            
            switch type
                case 'logical'
                    if sampsPerChanRead * numLines ~= size(outputData,1)
                        error('huh?')
                    end
                otherwise
                    if sampsPerChanRead ~= size(outputData,1)
                        error('huh?')
                    end
            end
            
            figure
            bin = fliplr(dec2bin(outputData,bits)=='1');
            bin = bin(:,1:numLines);
            plot(bin + .1*repmat(1:numLines,size(bin,1),1))
            % how get corresponding times/frames?
            
            keyboard
        catch e
            % after first iteration of LOOP, or on abortAcquisitionEnd, hDin is no good, can't read
            
            %  DAQmx Error (-200983) encountered in DAQmxGetReadAvailSampPerChan:
            %  You only can get the specified property while the task is reserved, committed or while the task is running.
            %
            % Reserve, commit or start the task prior to getting the property.
            
            getReport(e)
            % keyboard
        end
        
        %Stop Task, to allow it to be re-used on next acquisition start
        %this kills us if we're in LOOP, but do we have time after 'acquisitionStarted' to set it up again?
        if ~isempty(hDin) && isvalid(hDin)
            hDin.abort();
        end
        
    otherwise
        fprintf('%s got %s, but didn''t handle it\n',mfilename,eventName)
end