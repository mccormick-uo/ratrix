%%%analyzeS2PPhil
%%%MAKE SURE YOU HAVE THE CORRECT EXPERIMENT SELECTED IN make_db_Phil
close all
clear all

psfilename = 'C:\tempS2PPhil.ps';
if exist(psfilename,'file')==2;delete(psfilename);end

make_db_Phil

cd(procdir)
load(procfile)

newpdfFile = fullfile(procdir,[aniname '_' expdate '_S2P.pdf']);

%%%figure out how many actual cells there are take out any with nan values
for h = 1:length(expname)
    baddies = find(isnan(dat.Fcell{h}));
    [idx val] = ind2sub(size(dat.Fcell{h}),baddies);
    baddie = unique(idx);
    if ~isempty(baddie)
        sprintf('found %d bad cells in block %d',length(baddie),h)
        for i=1:length(baddie)
            dat.stat(baddie(i)).iscell = 0;
        end
        dat.Fcell{h}(baddies) = rand(length(baddies),1)/1000;
        dat.FcellNeu{h}(baddies) = rand(length(baddies),1)/1000;
    else
        sprintf('no bad cells in block %d',h)
    end
end

if ~isempty(baddie)
    save(procfile,'dat','-append')
    sprintf('rerunning deconvolution')
    make_db_Phil
    add_deconvolution(dat.ops,db);
    clear dat
    load(procfile)
    dat = {};
    dat.cl = cl;
    dat.clustrules = clustrules;
    dat.F = F;
    dat.Fcell = Fcell;
    dat.FcellNeu = FcellNeu;
    dat.figure = figure;
    dat.filename = filename;
    dat.map = map;
    dat.maxmap = maxmap;
    dat.mimg = mimg;
    dat.mimg_proc = mimg_proc;
    dat.ops = ops;
    dat.procmap = 0;
    dat.res = res;
    dat.stat = stat;
    dat.xlim = xlim;
    dat.ylim = ylim;
    save(procfile,'dat')
%     sprintf('please rerun this analysis')
%     
%     return
end

iscell = zeros(size(dat.Fcell{1},1),1);
for i = 1:length(iscell)
    if dat.stat(i).iscell
        iscell(i) = 1;
    end
end

cells = find(iscell);
usePts = {};
meanImg = squeeze(dat.mimg(:,:,2));meanShiftImg=meanImg;
cImage = squeeze(dat.mimg(:,:,5));
cropx = [1;size(meanImg,1)];
cropy = [1;size(meanImg,2)];
for k = 1:length(cells)
    usePts{k} = sub2ind(size(meanImg),dat.stat(cells(k)).ypix,dat.stat(cells(k)).xpix);
end

figure;imagesc(meanImg)
title('Mean Image')
axis off
if exist('psfilename','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfilename,'-append');
end

figure
usecells = usePts;
draw2pSegs(usePts,1:length(usecells),jet,size(meanShiftImg),1:length(usecells),[1 length(usecells)])
title('Cell Footprints')
if exist('psfilename','var')
    set(gcf, 'PaperPositionMode', 'auto');
    print('-dpsc',psfilename,'-append');
end

%%%save dF/F and spikes for each experiment only for real cells
for j = 1:size(dat.Fcell,2)
    spikes = zeros(length(cells),size(dat.Fcell{j},2));dF=spikes;
    for k = 1:length(cells)
        %%%make spike time/amp array
        times = find((dat.stat(cells(k)).st>dat.stat(cells(k)).blockstarts(j)&...
            (dat.stat(cells(k)).st<=dat.stat(cells(k)).blockstarts(j+1))));
        amps = dat.stat(cells(k)).c(times);
        times = dat.stat(cells(k)).st(times) - dat.stat(cells(k)).blockstarts(j);
        spikes(k,times) = amps;

        %%%make dF/F array
        F = dat.Fcell{j}(cells(k),:) - dat.FcellNeu{j}(cells(k),:)*dat.stat(cells(k)).neuropilCoefficient;
        F = F + (mean(dat.Fcell{j}(cells(k),:))-mean(F));
        F0 = prctile(F,10);
        dF(k,:) = (F-F0)/F0;
    end
    
    figure
    imagesc(spikes,[0 10])
    title(sprintf('spikes %s',expname{j}))
    if exist('psfilename','var')
        set(gcf, 'PaperPositionMode', 'auto');
        print('-dpsc',psfilename,'-append');
    end
    
    figure
    imagesc(dF,[0 1])
    title(sprintf('dF/F %s',expname{j}))
    if exist('psfilename','var')
        set(gcf, 'PaperPositionMode', 'auto');
        print('-dpsc',psfilename,'-append');
    end
    
    thisSession = fullfile(expdir,[expname{j}(1:strfind(expname{j},'V2')+1) '.mat']);
    load(thisSession,'greenframe');
    save(expname{j},'dF','greenframe','meanImg','usePts','spikes','meanShiftImg','cropx','cropy','thisSession','cImage')
end

dos(['ps2pdf ' psfilename ' "' newpdfFile '"'] )
if exist(newpdfFile,'file')
%     ['ps2pdf ' psfilename ' "' psfilenameFinal(1:(end-2)) 'pdf"']
    display('generated pdf using dos ps2pdf')
else
    try
        ps2pdf('psfile', psfilename, 'pdffile', newpdfFile)
        newpdfFile
        display('generated pdf using builtin matlab ps2pdf')
    catch
        display('couldnt generate pdf');
        keyboard
    end
end

delete(psfilename);


% for z = 1:10
% figure
% subplot(1,2,1)
% hold on
% plot(Fcell{1}(z,:));
% plot(FcellNeu{1}(z,:));
% plot(Fcell{1}(z,:)-FcellNeu{1}(z,:)*stat(z).neuropilCoefficient);
% xlim([1 3000])
% legend('cell F','neuropil','diff')
% hold off
% subplot(1,2,2)
% hold on
% plot(dF(z,:))
% plot(stat(z).st,stat(z).c/100,'r.','Markersize',5)
% legend('dF/F','spikes')
% xlim([1 3000])
% hold off
% mtit(sprintf('cell %d neuropilcoeff %0.2f',stat(z).iscell,stat(z).neuropilCoefficient))
% set(gca,'LooseInset',get(gca,'TightInset'),'fontsize',8)
% end