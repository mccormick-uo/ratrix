%%%loads in individual animal 2p size select data and performs group
%%%analysis
close all
clear all

peakWindow = 9:12;
dt = 0.1;
cyclelength = 1/0.1;

%where are the files
dirs = {'\\langevin\backup\twophoton\Phil\Compiled2p\071416 G62TX210TT size select2\G62TX210TT'...
    '\\langevin\backup\twophoton\Phil\Compiled2p\071016 G62EE8TT sizeselect\G62EE8TT'...
    '\\langevin\backup\twophoton\Phil\Compiled2p\071016 G62AA3TT sizeselect\G62AA3TT'...
    '\\langevin\backup\twophoton\Phil\Compiled2p\070816 G62BB8RT sizeselect\G62BB8RT'...
    '\\langevin\backup\twophoton\Phil\Compiled2p\070516 G62Y9RT sizeselect\G62Y9RT'...
    '\\langevin\backup\twophoton\Phil\Compiled2p\062416 G62TX19LT size select\G62TX19LT'};

%stimulus file
moviename = 'C:\sizeSelect2sf8sz26min.mat';
load(moviename);
sizeVals = [0 5 10 20 30 40 50 60];
contrastRange = unique(contrasts); sfrange = unique(sf); phaserange = unique(phase);
for i = 1:length(contrastRange);contrastlist{i} = num2str(contrastRange(i));end
for i=1:length(sizeVals); sizes{i} = num2str(sizeVals(i)); end
% sf=[sf sf];phase=[phase phase];radius=[radius radius];tf=[tf tf];theta=[theta theta];xpos=[xpos xpos];ypos=[ypos ypos];
ntrials= length(contrasts);
onsets = dt + (0:ntrials-1)*(isi+duration);
timepts = 1:(2*isi+duration)/dt;
timepts = (timepts-1)*dt;

[f p] = uiputfile('*.pdf','pdf file');
newpdfFile = fullfile(p,f);

psfile = 'c:\temp.ps';
if exist(psfile,'file')==2;delete(psfile);end

%load pre data
cellcnt = 1;
grpdftuningPRE = nan(10000,15,2,6,4,8,2);
grpsptuningPRE = nan(10000,15,2,6,4,8,2);
grppeaksPRE = nan(length(dirs),8,2);
for i = 1:length(dirs)
    load(fullfile(dirs{i},'ssSummaryPRE.mat'))
    numcells = size(dftuning,1);
    grpdftuningPRE(cellcnt:cellcnt+numcells-1,:,:,:,:,:,:) = dftuning;
    grpsptuningPRE(cellcnt:cellcnt+numcells-1,:,:,:,:,:,:) = sptuning;
    grppeaksPRE(i,:,:) = avgpeaks;
    cellcnt = cellcnt + numcells;
end

%load post data
cellcnt = 1;
grpdftuningPOST = nan(1000,15,2,6,4,8,2);
grpsptuningPOST = nan(1000,15,2,6,4,8,2);
grppeaksPOST = nan(length(dirs),8,2);
for i = 1:length(dirs)
    load(fullfile(dirs{i},'ssSummaryPOST.mat'))
    numcells = size(dftuning,1);
    grpdftuningPOST(cellcnt:cellcnt+numcells-1,:,:,:,:,:,:) = dftuning;
    grpsptuningPOST(cellcnt:cellcnt+numcells-1,:,:,:,:,:,:) = sptuning;
    grppeaksPOST(i,:,:) = avgpeaks;
    cellcnt = cellcnt + numcells;
end

%%%dfof plotting
%plot responses as a function of contrast/size
figure
subplot(2,2,1)
hold on
for i=1:length(contrastRange)
    plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpdftuningPRE(:,peakWindow,:,:,i,:,1),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,5,:,:,i,:,1),4),3),1)));
end
axis([0 length(radiusRange)+1 -0.01 0.1])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend(contrastlist,'location','northwest')
xlabel('Stim Size (deg)')
ylabel('PRE stationary dfof')
subplot(2,2,2)
hold on
for i=1:length(contrastRange)
    plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpdftuningPRE(:,peakWindow,:,:,i,:,2),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,5,:,:,i,:,2),4),3),1)));
end
axis([0 length(radiusRange)+1 -0.01 0.1])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend(contrastlist,'location','northwest')
xlabel('Stim Size (deg)')
ylabel('PRE running dfof')
subplot(2,2,3)
hold on
for i=1:length(contrastRange)
    plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpdftuningPOST(:,peakWindow,:,:,i,:,1),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpdftuningPOST(:,5,:,:,i,:,1),4),3),1)));
end
axis([0 length(radiusRange)+1 -0.01 0.1])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend(contrastlist,'location','northwest')
xlabel('Stim Size (deg)')
ylabel('POST stationary dfof')
subplot(2,2,4)
hold on
for i=1:length(contrastRange)
    plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpdftuningPOST(:,peakWindow,:,:,i,:,2),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpdftuningPOST(:,5,:,:,i,:,2),4),3),1)));
end
axis([0 length(radiusRange)+1 -0.01 0.1])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend(contrastlist,'location','northwest')
xlabel('Stim Size (deg)')
ylabel('POST running dfof')
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end

%plot full contrast response peaks across sizes 
figure
subplot(1,2,1)
hold on
plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpdftuningPRE(:,peakWindow,:,:,end,:,1),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,5,:,:,end,:,1),4),3),1)),'k');
plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpdftuningPOST(:,peakWindow,:,:,end,:,1),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpdftuningPOST(:,5,:,:,end,:,1),4),3),1)),'r');
axis([0 length(radiusRange)+1 -0.01 0.1])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend('PRE','POST','location','northwest')
xlabel('Stim Size (deg)')
ylabel('stationary dfof')
subplot(1,2,2)
hold on
plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpdftuningPRE(:,peakWindow,:,:,end,:,2),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,5,:,:,end,:,2),4),3),1)),'k');
plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpdftuningPOST(:,peakWindow,:,:,end,:,2),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpdftuningPOST(:,5,:,:,end,:,2),4),3),1)),'r');
axis([0 length(radiusRange)+1 -0.01 0.1])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend('PRE','POST','location','northwest')
xlabel('Stim Size (deg)')
ylabel('running dfof')
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end

%plot cycle averages for all sizes
figure
for i = 1:length(sizes)
    subplot(2,ceil(length(sizes)/2),i)
    hold on
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,:,:,:,end,i,1),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,5,:,:,end,i,1),4),3),1)),'k')
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpdftuningPOST(:,:,:,:,end,i,1),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpdftuningPOST(:,5,:,:,end,i,1),4),3),1)),'r')
    axis([timepts(1) timepts(end) -0.01 0.1])
end
mtit('Stationary dfof per size')
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end
figure
for i = 1:length(sizes)
    subplot(2,ceil(length(sizes)/2),i)
    hold on
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,:,:,:,end,i,2),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,5,:,:,end,i,2),4),3),1)),'k')
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpdftuningPOST(:,:,:,:,end,i,2),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpdftuningPOST(:,5,:,:,end,i,2),4),3),1)),'r')
    axis([timepts(1) timepts(end) -0.01 0.1])
end
mtit('Running dfof per size')
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end

%plot cycle averages with sizes on same plot
figure
subplot(1,2,1)
hold on
for i = 1:length(sizes)
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,:,:,:,end,i,1),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,5,:,:,end,i,1),4),3),1)))
end
legend(sizes,'location','northwest')
xlabel('Time (s)')
ylabel('Stationary dfof')
axis([timepts(1) timepts(end) -0.01 0.1])
subplot(1,2,2)
hold on
for i = 1:length(sizes)
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,:,:,:,end,i,2),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpdftuningPRE(:,5,:,:,end,i,2),4),3),1)))
end
legend(sizes,'location','northwest')
xlabel('Time (s)')
ylabel('Running dfof')
axis([timepts(1) timepts(end) -0.01 0.1])
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end

%%%same plotting for spikes
%plot responses as a function of contrast/size
figure
subplot(2,2,1)
hold on
for i=1:length(contrastRange)
    plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpsptuningPRE(:,peakWindow,:,:,i,:,1),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,5,:,:,i,:,1),4),3),1)));
end
axis([0 length(radiusRange)+1 -0.01 0.3])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend(contrastlist,'location','northwest')
xlabel('Stim Size (deg)')
ylabel('PRE stationary spikes')
subplot(2,2,2)
hold on
for i=1:length(contrastRange)
    plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpsptuningPRE(:,peakWindow,:,:,i,:,2),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,5,:,:,i,:,2),4),3),1)));
end
axis([0 length(radiusRange)+1 -0.01 0.3])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend(contrastlist,'location','northwest')
xlabel('Stim Size (deg)')
ylabel('PRE running spikes')
subplot(2,2,3)
hold on
for i=1:length(contrastRange)
    plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpsptuningPOST(:,peakWindow,:,:,i,:,1),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpsptuningPOST(:,5,:,:,i,:,1),4),3),1)));
end
axis([0 length(radiusRange)+1 -0.01 0.3])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend(contrastlist,'location','northwest')
xlabel('Stim Size (deg)')
ylabel('POST stationary spikes')
subplot(2,2,4)
hold on
for i=1:length(contrastRange)
    plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpsptuningPOST(:,peakWindow,:,:,i,:,2),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpsptuningPOST(:,5,:,:,i,:,2),4),3),1)));
end
axis([0 length(radiusRange)+1 -0.01 0.3])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend(contrastlist,'location','northwest')
xlabel('Stim Size (deg)')
ylabel('POST running spikes')
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end

%plot full contrast response peaks across sizes 
figure
subplot(1,2,1)
hold on
plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpsptuningPRE(:,peakWindow,:,:,end,:,1),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,5,:,:,end,:,1),4),3),1)),'k');
plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpsptuningPOST(:,peakWindow,:,:,end,:,1),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpsptuningPOST(:,5,:,:,end,:,1),4),3),1)),'r');
axis([0 length(radiusRange)+1 -0.01 0.3])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend('PRE','POST','location','northwest')
xlabel('Stim Size (deg)')
ylabel('stationary spikes')
subplot(1,2,2)
hold on
plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpsptuningPRE(:,peakWindow,:,:,end,:,2),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,5,:,:,end,:,2),4),3),1)),'k');
plot(1:length(radiusRange),squeeze(nanmean(nanmean(nanmean(nanmean(grpsptuningPOST(:,peakWindow,:,:,end,:,2),4),3),1),2))-squeeze(nanmean(nanmean(nanmean(grpsptuningPOST(:,5,:,:,end,:,2),4),3),1)),'r');
axis([0 length(radiusRange)+1 -0.01 0.3])
set(gca,'xtick',1:length(sizeVals),'xticklabel',sizes)
legend('PRE','POST','location','northwest')
xlabel('Stim Size (deg)')
ylabel('running spikes')
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end

%plot cycle averages for all sizes
figure
for i = 1:length(sizes)
    subplot(2,ceil(length(sizes)/2),i)
    hold on
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,:,:,:,end,i,1),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,5,:,:,end,i,1),4),3),1)),'k')
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpsptuningPOST(:,:,:,:,end,i,1),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpsptuningPOST(:,5,:,:,end,i,1),4),3),1)),'r')
    axis([timepts(1) timepts(end) -0.01 0.3])
end
mtit('Stationary spikes per size')
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end
figure
for i = 1:length(sizes)
    subplot(2,ceil(length(sizes)/2),i)
    hold on
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,:,:,:,end,i,2),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,5,:,:,end,i,2),4),3),1)),'k')
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpsptuningPOST(:,:,:,:,end,i,2),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpsptuningPOST(:,5,:,:,end,i,2),4),3),1)),'r')
    axis([timepts(1) timepts(end) -0.01 0.3])
end
mtit('Running spikes per size')
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end

%plot cycle averages with sizes on same plot
figure
subplot(1,2,1)
hold on
for i = 1:length(sizes)
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,:,:,:,end,i,1),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,5,:,:,end,i,1),4),3),1)))
end
legend(sizes,'location','northwest')
xlabel('Time (s)')
ylabel('Stationary spikes')
axis([timepts(1) timepts(end) -0.01 0.3])
subplot(1,2,2)
hold on
for i = 1:length(sizes)
    plot(timepts,squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,:,:,:,end,i,2),4),3),1))-squeeze(nanmean(nanmean(nanmean(grpsptuningPRE(:,5,:,:,end,i,2),4),3),1)))
end
legend(sizes,'location','northwest')
xlabel('Time (s)')
ylabel('Running spikes')
axis([timepts(1) timepts(end) -0.01 0.3])
if exist('psfile','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfile,'-append');
end


save('sizeSelectGroupAnalysis','grpdftuningPRE','grpdftuningPOST','grpsptuningPRE','grpsptuningPOST','grppeaksPRE','grppeaksPOST')

try
    dos(['ps2pdf ' 'c:\temp.ps "' newpdfFile '"'] )

catch
    display('couldnt generate pdf');
end

