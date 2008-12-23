function [sm updateCache]=cacheSounds(sm,station)
if isa(station,'station')

    updateCache=false;

    if getSoundOn(station) && length(sm.players)~=length(sm.clips)
        warning('recaching sounds, this is expensive\n')

        updateCache=true;

        soundNames = getSoundNames(sm);

        sm=uninit(sm,station); %need to clean up any existing buffers

        dllPath=fullfile(PsychtoolboxRoot, 'portaudio_x86.dll');
        if iswin && exist(dllPath,'file') && length(soundNames)>1
            warning('found enhanced asio driver -- disabling because this only allows us to make one buffer')
            [status,message,messageid]=movefile(dllPath,fullfile(PsychtoolboxRoot, 'disabled.portaudio_x86.dll'));
            if ~status || exist(dllPath,'file')
                message
                messageid
                error('couldn''t disable enhanced psychportaudio dll')
            end
        end

        InitializePsychSound(1);


        for i=1:length(soundNames)
            [clip sampleRate sm updateSMCache] = getSound(sm,soundNames{i});

            if size(clip,1)>2
                clip=clip'; %psychportaudio requires channels to be rows
            end
            switch size(clip,1)
                case 1
                    clip(2,:) = clip(1,:);
                case 2
                    %pass
                otherwise
                    error('max 2 channels')
            end

            latclass=4; %2 ok?
            if iswin
                buffsize=4096; %max -- otherwise crackles if using asio4all (should detect if have native asio card and not do this)
            else
                buffsize=[];
            end
            sm.players{i}= PsychPortAudio('Open',[],[],latclass,sampleRate,2,buffsize);

            s=PsychPortAudio('GetStatus',sm.players{i});

            if s.SampleRate~=sampleRate
                sampleRate
                s.SampleRate
                error('didn''t get requested sample rate')
            end

            %only way to get ppa('stop') to return in <1ms rather tha >10ms is to have asio card AND enhanced dll.
            %otherwise, fastest ppa('stop') on windows is 10ms (black/dell)
            %others: 20ms (beige), 25ms (osx, but once got a session down to 2, don't know how)

            %on beige: audioplayer fastest start is 20ms, stop is 15ms.
            %osx start is 2ms, but stop is 60ms!
            %both blacks/dells, both ~2ms!  add this option back...
            
            %without audioplayer or asio card+enhanced dll,
            %cannot eliminate framedrops on beige or dell(ati), can on black/dell(nvidia) at 100Hz (nosound), osx(nosound/notext) at 60Hz            
            
            PsychPortAudio('FillBuffer', sm.players{i}, clip);
            PsychPortAudio('GetStatus', sm.players{i})

            sm.clipDurs(i)=size(clip,2)/sampleRate;
        end
    end
else
    error('need a station')
end