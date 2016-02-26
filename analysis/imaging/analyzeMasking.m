% function [cycavg tuning] = analyzeMasking(dfof_bg,sp,moviename,useframes,base,xpts,ypts, label,stimRec,psfilename,frameT);
% close all
% clear all
%% code from analyzeWidefieldDOI
batchDOIphilMaskSizesel

   alluse = find(strcmp({files.inject},'doi')  & strcmp({files.timing},'pre') & strcmp({files.label},'camk2 gc6') & strcmp({files.notes},'good imaging session')  ) 
  
length(alluse)
%alluse=alluse(1:5)
%alluse=alluse(end-5:end);
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
doMasking;
end
