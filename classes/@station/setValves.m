function setValves(s, valves)
if strcmp(s.responseMethod,'parallelPort')
    if length(valves)==s.numPorts
        valves=logical(valves);
        
        % temporary hack -- right now we rely on the fact that no one
        % (including the station) accesses the valves except through 
        % setValves and getValves, but we can't guarantee this.
        if length(valves)~=length(s.valvePins)
            if isscalar(s.valvePins)
                valves=any(valves); %route all rewards to single valve
            else
                error('bad valve vector')
            end
        end
        
        valves(s.valvePins.invs)=~valves(s.valvePins.invs);
        lptWriteBits(s.valvePins.decAddr,s.valvePins.bitLocs,valves);
    else
        error('valves must be a vector of length numValves')
    end
else
    if ~ismac
        warning('can''t set valves without parallel port')
    end
end