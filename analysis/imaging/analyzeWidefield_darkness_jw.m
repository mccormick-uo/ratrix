

clear all;

batch_darkness_learned

batchLearningBehav

%batc_backgroundGrating_learned
%batchTopoFrontiers
%batchAcrylic_testing_jw
%batchBehav_8mm

close all
psfilename = 'C:\tempPS.ps';
if exist(psfilename,'file')==2;delete(psfilename);end

for i =1:length(files);
    hasdarkness(i) = ~isempty(files(i).darkness);
end

   alluse = find(  strcmp({files.notes},'good imaging session') & hasdarkness ) 

    
     % alluse = find(  strcmp({files.notes},'good imaging session') & hasdarkness & strcmp({files.task},'GTS') ) 
        %alluse = find(  strcmp({files.notes},'good imaging session') & hasdarkness & strcmp({files.task},'HvV') ) 
   
length(alluse)
allsubj = unique({files(alluse).subj})



%%% use this one for subject by subject averaging
%for s = 1:length(allsubj)
%use = intersect(alluse,find(strcmp({files.subj},allsubj{s})))    

%%% use this one to average all sessions that meet criteria
for s=1:1
use = alluse;

allsubj{s}

%%% calculate gradients and regions
clear map merge

x0 =0; y0=0; sz = 128;
doTopography;
 doCorrelationMap
%doGratingsNew;
% %%% analyze looming
% for f = 1:length(use)
%     loom_resp{f}=fourPhaseOverlay(files(use(f)),pathname,outpathname,'loom');
% end
% fourPhaseAvg(loom_resp,allxshift+x0,allyshift+y0,allthetashift,zoom, sz, avgmap);


%%% analyze grating
% for f = 1:length(use)
%  f
%  grating_resp{f}=fourPhaseOverlay(files(use(f)),pathname,outpathname,'grating');
% end
% fourPhaseAvg(grating_resp,allxshift+x0,allyshift+y0, allthetashift,zoom*0.57, sz, avgmap);



end
[f p] = uiputfile('*.mat','save data?');
sessiondata = files(alluse);

if f~=0
%     save(fullfile(p,f),'allsubj','sessiondata','shiftData','fit','mnfit','cycavg','mv');
    save(fullfile(p,f),'allsubj','sessiondata','fit','mnfit','cycavg','mv');
end

[f p] = uiputfile('*.pdf','save pdf');
if f~=0
    try
   ps2pdf('psfile', psfilename, 'pdffile', fullfile(p,f));
catch
    display('couldnt generate pdf');
    end
end
delete(psfilename);


