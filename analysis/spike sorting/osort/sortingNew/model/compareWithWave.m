% evaluate performance of wave_clus on simulated data to establish
% performance of good offline algorithm (wavelets).
%
%urut/nov05
%


basepath='C:\Documents and Settings\Administrator\Desktop\ueli\code\sortingNew\model\';
cd(basepath);
colors={'r','b','g','m','c','y','k',[0.5 0.5 0.5],[1 0 0.5]};

simNrs=[1 2 3];
for kk=1:length(simNrs)
    simNr=simNrs(kk);
    noiseLevels=1:4;

    switch (simNr)
        case 1
            realWaveformsInd=([  81 122 77 ]);
        case 2
            realWaveformsInd=([ 49 36 81 ]);
        case 3
            realWaveformsInd=([92 61  77 70 44]);
    end
    nrNeurons=length(realWaveformsInd);

    %load ground truth
    load([basepath '\sim' num2str(simNr) '\simulation' num2str(simNr) '.mat']);

    perfWave=[];
    for nLevel=1:length(noiseLevels)
        load([basepath '\simSpikes-sim' num2str(simNr) '-n' num2str(nLevel) '.mat']);  %this file generated by wave_clus
        load([basepath '\times_simSpikes-sim' num2str(simNr) '-n' num2str(nLevel) '.mat']);  %this file generated by wave_clus

        clu=cluster_class(:,1);
        cluNrs = unique(clu);
        nrClusters = length(cluNrs);

        %-- map to original clusters    
        figure(simNr*200)
        subplot(2,2,1)
        hold on
        for i=1:nrNeurons
            plot ( scalingFactorSpikes(i)*allMeans(realWaveformsInd(i),:) , colors{i}, 'LineWidth', 3 );
        end
        hold off
        xlabel('1=r,2=b,3=g,4=m,5=c,6=y,7=k');
        title('orig means');

        subplot(2,2,2)
        hold on
        for j=1:nrClusters  %first is always noise,don't display
            plot( 1:size(spikes,2), spikes( find(clu==cluNrs(j)) ,:), 'color',colors{j});
        end
        hold off
        
        switch(simNr)
            case 1
                switch (nLevel)
                    case 1
                        reorder=[1 2 3; 3 2 4];
                    case 2
                        reorder=[1 2 3;3 2 4];
                    case 3
                        reorder=[1 2 3;3 2 4];
                    case 4     
                        reorder=[1 2 3;3 2 4];
                end
            case 2
                switch (nLevel)
                    case 1
                        reorder=[1 2 3; 3 2 4];
                    case 2
                        reorder=[1 2 3; 4 2 3];
                    case 3
                        %reorder=[1 2 3; 99 3 2];
                        reorder=[1 2 3; 3 4 2];
                    case 4     
                        reorder=[1 2 3; 99 3 2];
                end                
            case 3
                switch (nLevel)
                    case 1
                        reorder=[1 2 3 4 5;4 5 6 3 2];
                    case 2
                        reorder=[1 2 3 4 5;8 5 99 3 2 ];
                    case 3
                        reorder=[1 2 3 4 5;99 4 99 3 2];
                    case 4     
                        reorder=[1 2 3 4 5;5 99 99 3 2];
                end                
                
        end
        

        nrAssigned=[];
        for j=1:nrClusters
            nrAssigned(j,1:2) = [cluNrs(j) length( find(clu==cluNrs(j)))];
        end
        nrAssigned = flipud(nrAssigned);
        
        
        %remapped
        subplot(2,2,3)
        hold on

        allInds=[];
        inds=[];
        orderNeurons = sort(reorder(2,:));
        for preInd=1:length(orderNeurons)
            if orderNeurons(preInd)==99
                inds{preInd} =[];
                continue;
            end
            
            ii = find( reorder(2,:) == orderNeurons(preInd) );
            inds{preInd} = find( nrAssigned(end-reorder(2,ii)+1,1)==clu);
            allInds=[allInds inds{preInd}'];
        end        
        
        %plot noise (unsorted)
        plot ( spikes( setdiff( 1:length(clu), allInds),:)', 'k');
        
        %plot sorted
        for preInd=1:length(orderNeurons)
             ii = find( reorder(2,:) == orderNeurons(preInd) );
             if length(inds{preInd})>0
                plot ( spikes ( inds{preInd}, : )', colors{ii} );
            end
        end
        hold off        
        
        %if some clusters were not found,assign to noise (not relevant for
        %perf calculation,since they are excluded.
        indsEmpty = find(reorder(2,:)==99);
        if length(indsEmpty)>0
            reorder(2,indsEmpty)=ones(1,length(indsEmpty));
        end
        
        [perf, indsNoiseWaveforms] = evalPerformance(nrNeurons, spikeTimestamps, spiketimes, reorder,nrAssigned,clu);

        perfOrig=perf;
        
        %exclude clusters that weren't found
        if length(indsEmpty)>0
            perf = perf( setdiff(1:size(perf,1),indsEmpty),:);    
        end
                
        perfWave{nLevel}=perf;

        perfWaveOrig{nLevel}=perf;

    end
    
    save(['results-waveOrig-S' num2str(simNr) '.mat'],'perfWaveOrig');

end