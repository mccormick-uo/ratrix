%batchPhilIntactSkull
% close all
clear 

dbstop if error

% pathname = '\\langevin\backup\widefield\Acrilic cleared skull headplate\';
% datapathname = '\\langevin\backup\widefield\Acrilic cleared skull headplate\';  
% outpathname = '\\langevin\backup\widefield\Acrilic cleared skull headplate\';

% pathname = 'C:\Users\nlab\Desktop\widefield\'
% datapathname = 'C:\Users\nlab\Desktop\widefield\'
% outpathname = 'C:\Users\nlab\Desktop\widefielcycMapd\'
% 
% pathname = 'D:\Elliott\DOIwidefield\';
% datapathname = 'D:\Elliott\DOIwidefield\';
% outpathname = 'D:\Elliott\DOIwidefield\';

pathname = 'D:\Angie\';
datapathname = 'D:\Angie\';
outpathname = 'D:\Angie\';

n = 0;

% %%
% n=n+1;
% files(n).subj = 'G62QQ10LN';
% files(n).expt = '110717';
% files(n).topox= '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_TOPOX\110717_G62QQ10LN_SALINE_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_TOPOX\110717_G62QQ10LN_SALINE_RIG2_TOPOX';
% files(n).topoy = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_TOPOY\110717_G62QQ10LN_SALINE_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_TOPOY\110717_G62QQ10LN_SALINE_RIG2_TOPOY';
% files(n).darkness =  '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_PRE_DARKNESS\110717_G62QQ10LN_SALINE_RIG2_PRE_DARKNESSmaps.mat';
% files(n).darknessdata = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_PRE_DARKNESS\110717_G62QQ10LN_SALINE_RIG2_PRE_DARKNESS';
% files(n).patchonpatch =  '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_PRE_PATCHONPATCH\110717_G62QQ10LN_SALINE_RIG2_PRE_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_PRE_PATCHONPATCH\110717_G62QQ10LN_SALINE_RIG2_PRE_PATCHONPATCH';
% files(n).inject = 'saline';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness';
% files(n).timing = 'pre';
% files(n).patchpts = '110717_G62QQ10LN_SALINE_RIG2\G62QQ10LNpatchpts.mat';
% files(n).circpts = '110717_G62QQ10LN_SALINE_RIG2\G62QQ10LNcircpts.mat';
% 
% n=n+1;
% files(n).subj = 'G62QQ10LN';
% files(n).expt = '110717';
% files(n).topox= '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_TOPOX\110717_G62QQ10LN_SALINE_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_TOPOX\110717_G62QQ10LN_SALINE_RIG2_TOPOX';
% files(n).topoy = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_TOPOY\110717_G62QQ10LN_SALINE_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_TOPOY\110717_G62QQ10LN_SALINE_RIG2_TOPOY';
% files(n).darkness =  '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_POST_DARKNESS\110717_G62QQ10LN_SALINE_RIG2_POST_DARKNESSmaps.mat';
% files(n).darknessdata = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_POST_DARKNESS\110717_G62QQ10LN_SALINE_RIG2_POST_DARKNESS';
% files(n).patchonpatch =  '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_POST_PATCHONPATCH\110717_G62QQ10LN_SALINE_RIG2_POST_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '110717_G62QQ10LN_SALINE_RIG2\110717_G62QQ10LN_SALINE_RIG2_POST_PATCHONPATCH\110717_G62QQ10LN_SALINE_RIG2_POST_PATCHONPATCH';
% files(n).inject = 'saline';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness';
% files(n).timing = 'post';
% files(n).patchpts = '110717_G62QQ10LN_SALINE_RIG2\G62QQ10LNpatchpts.mat';
% files(n).circpts = '110717_G62QQ10LN_SALINE_RIG2\G62QQ10LNcircpts.mat';
% 
% 
% %%
% n=n+1;
% files(n).subj = 'G62FFF_TT';
% files(n).expt = '111017';
% files(n).topox= '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_TOPOX\111017_G62FFF7TT_DOI_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_TOPOX\111017_G62FFF7TT_DOI_RIG2_TOPOX';
% files(n).topoy = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_TOPOY\111017_G62FFF7TT_DOI_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_TOPOY\111017_G62FFF7TT_DOI_RIG2_TOPOY';
% files(n).darkness =  '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_DARKNESS\111017_G62FFF7TT_DOI_RIG2_DARKNESSmaps.mat';
% files(n).darknessdata = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_DARKNESS\111017_G62FFF7TT_DOI_RIG2_DARKNESS';
% files(n).patchonpatch =  '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_PATCHONPATCH\111017_G62FFF7TT_DOI_RIG2_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_PATCHONPATCH\111017_G62FFF7TT_DOI_RIG2_PATCHONPATCH';
% files(n).inject = 'doi';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness';
% files(n).timing = 'pre';
% files(n).patchpts = '111017_G62FFF_TT_DOI_RIG2\G62FFF_TTpatchpts.mat';
% files(n).circpts = '111017_G62FFF_TT_DOI_RIG2\G62FFF_TTcircpts.mat';
% 
% n=n+1;
% files(n).subj = 'G62FFF_TT';
% files(n).expt = '111017';
% files(n).topox= '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_TOPOX\111017_G62FFF7TT_DOI_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_TOPOX\111017_G62FFF7TT_DOI_RIG2_TOPOX';
% files(n).topoy = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_TOPOY\111017_G62FFF7TT_DOI_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_TOPOY\111017_G62FFF7TT_DOI_RIG2_TOPOY';
% files(n).darkness =  '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_POST_DARKNESS\111017_G62FFF7TT_DOI_RIG2_POST_DARKNESSmaps.mat';
% files(n).darknessdata = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_POST_DARKNESS\111017_G62FFF7TT_DOI_RIG2_POST_DARKNESS';
% files(n).patchonpatch =  '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_POST_PATCHONPATCH\111017_G62FFF7TT_DOI_RIG2_POST_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '111017_G62FFF_TT_DOI_RIG2\111017_G62FFF_TT_DOI_RIG2_POST_PATCHONPATCH\111017_G62FFF7TT_DOI_RIG2_POST_PATCHONPATCH';
% files(n).inject = 'doi';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness';
% files(n).timing = 'post';
% files(n).patchpts = '111017_G62FFF_TT_DOI_RIG2\G62FFF7TTpatchpts.mat';
% files(n).circpts = '111017_G62FFF_TT_DOI_RIG2\G62FFF7TTcircpts.mat';
% 
% 
% %%
% n=n+1;
% files(n).subj = 'G6H3.1_LT';
% files(n).expt = '111017';
% files(n).topox= '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_TOPOX\111017_G6H3.1_LT_SALINE_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_TOPOX\111017_G6H3.1_LT_SALINE_RIG2_TOPOX';
% files(n).topoy = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_TOPOY\111017_G6H3.1_LT_SALINE_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_TOPOY\111017_G6H3.1_LT_SALINE_RIG2_TOPOX';
% files(n).darkness =  '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_DARKNESS\111017_G6H3.1_LT_SALINE_RIG2_DARKNESSmaps.mat';
% files(n).darknessdata = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_DARKNESS\111017_G6H3.1_LT_SALINE_RIG2_DARKNESS';
% files(n).patchonpatch =  '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_PATCHONPATCH\111017_G6H3.1_LT_SALINE_RIG2_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_PATCHONPATCH\111017_G6H3.1_LT_SALINE_RIG2_PATCHONPATCH';
% files(n).inject = 'saline';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'pre';
% files(n).patchpts = '111017_G6H3.1_LT_SALINE_RIG2\G6H3.1_LTpatchpts.mat';
% files(n).circpts = '111017_G6H3.1_LT_SALINE_RIG2\G6H3.1_LTcircpts.mat';
% 
% n=n+1;
% files(n).subj = 'G6H3.1_LT';
% files(n).expt = '111017';
% files(n).topox= '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_TOPOX\111017_G6H3.1_LT_SALINE_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_TOPOX\111017_G6H3.1_LT_SALINE_RIG2_TOPOX';
% files(n).topoy = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_TOPOY\111017_G6H3.1_LT_SALINE_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_TOPOY\111017_G6H3.1_LT_SALINE_RIG2_TOPOX';
% files(n).darkness =  '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_POST_DARKNESS\111017_G6H3.1_LT_SALINE_RIG2_POST_DARKNESSmaps.mat';
% files(n).darknessdata = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_POST_DARKNESS\111017_G6H3.1_LT_SALINE_RIG2_POST_DARKNESS';
% files(n).patchonpatch =  '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_POST_PATCHONPATCH\111017_G6H3.1_LT_SALINE_RIG2_PRE_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '111017_G6H3.1_LT_SALINE_RIG2\111017_G6H3.1_LT_SALINE_RIG2_POST_PATCHONPATCH\111017_G6H3.1_LT_SALINE_RIG2_PRE_PATCHONPATCH';
% files(n).inject = 'saline';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'post';
% files(n).patchpts = '111017_G6H3.1_LT_SALINE_RIG2\G6H3.1_LTpatchpts.mat';
% files(n).circpts = '111017_G6H3.1_LT_SALINE_RIG2\G6H3.1_LTcircpts.mat';
% 
% 
% %%
% 
% n=n+1;
% files(n).subj = 'G62QQ10LT';
% files(n).expt = '111617';
% files(n).topox= '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_TOPOX\111617_G62QQ10LT_DOI_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_TOPOX\111617_G62QQ10LT_DOI_RIG2_TOPOX';
% files(n).topoy = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_TOPOY\111617_G62QQ10LT_DOI_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_TOPOY\111617_G62QQ10LT_DOI_RIG2_TOPOY';
% files(n).darkness =  '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_DARKNESS\111617_G62QQ10LT_DOI_RIG2_DARKNESSmaps.mat';
% files(n).darknessdata = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_DARKNESS\111617_G62QQ10LT_DOI_RIG2_DARKNESS';
% files(n).patchonpatch =  '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_PATCHONPATCH\111617_G62QQ10LT_DOI_RIG2_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_PATCHONPATCH\111617_G62QQ10LT_DOI_RIG2_PATCHONPATCH';
% files(n).inject = 'doi';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'pre';
% files(n).patchpts = '111617_G62QQ10LT_DOI_RIG2\G62QQ10LTpatchpts.mat';
% files(n).circpts = '111617_G62QQ10LT_DOI_RIG2\G62QQ10LTcircpts.mat';
% 
% n=n+1;
% files(n).subj = 'G62QQ10LT';
% files(n).expt = '111617';
% files(n).topox= '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_TOPOX\111617_G62QQ10LT_DOI_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_TOPOX\111617_G62QQ10LT_DOI_RIG2_TOPOX';
% files(n).topoy = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_TOPOY\111617_G62QQ10LT_DOI_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_RIG2_TOPOY\111617_G62QQ10LT_DOI_RIG2_TOPOY';
% files(n).darkness =  '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_POST_RIG2_DARKNESS\111617_G62QQ10LT_DOI_POST_RIG2_DARKNESSmaps.mat';
% files(n).darknessdata = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_POST_RIG2_DARKNESS\111617_G62QQ10LT_DOI_POST_RIG2_DARKNESS';
% files(n).patchonpatch =  '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_POST_RIG2_PATCHONPATCH\111617_G62QQ10LT_DOI_POST_RIG2_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '111617_G62QQ10LT_DOI_RIG2\111617_G62QQ10LT_DOI_POST_RIG2_PATCHONPATCH\111617_G62QQ10LT_DOI_POST_RIG2_PATCHONPATCH';
% files(n).inject = 'doi';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'post';
% files(n).patchpts = '111617_G62QQ10LT_DOI_RIG2\G62QQ10LTpatchpts.mat';
% files(n).circpts = '111617_G62QQ10LT_DOI_RIG2\G62QQ10LTcircpts.mat';
% 
% 
% %%
% n=n+1;
% files(n).subj = 'G62FFF7TT';
% files(n).expt = '112917';
% files(n).topox= '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_TOPOX\112917_G62FFF7TT_SALINE_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_TOPOX\112917_G62FFF7TT_SALINE_RIG2_TOPOX';
% files(n).topoy = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_TOPOY\112917_G62FFF7TT_SALINE_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_TOPOY\112917_G62FFF7TT_SALINE_RIG2_TOPOY';
% files(n).darkness =  '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_PRE_DARKNESS\112917_G62FFF7TT_SALINE_RIG2_PRE_DARKNESSmaps.mat';
% files(n).darknessdata = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_PRE_DARKNESS\112917_G62FFF7TT_SALINE_RIG2_PRE_DARKNESS';
% files(n).patchonpatch =  '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_PRE_PATCHONPATCH\112917_G62FFF7TT_SALINE_RIG2_PRE_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_PRE_PATCHONPATCH\112917_G62FFF7TT_SALINE_RIG2_PRE_PATCHONPATCH';
% files(n).inject = 'saline';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'pre';
% files(n).patchpts = '112917_G62FFF7TT_SALINE_RIG2\G62FFF7TTpatchpts.mat';
% files(n).circpts = '112917_G62FFF7TT_SALINE_RIG2\G62FFF7TTcircpts.mat';
% 
% n=n+1;
% files(n).subj = 'G62FFF7TT';
% files(n).expt = '112917';
% files(n).topox= '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_TOPOX\112917_G62FFF7TT_SALINE_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_TOPOX\112917_G62FFF7TT_SALINE_RIG2_TOPOX';
% files(n).topoy = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_TOPOY\112917_G62FFF7TT_SALINE_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_TOPOY\112917_G62FFF7TT_SALINE_RIG2_TOPOY';
% files(n).darkness =  '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_POST_DARKNESS\112917_G62FFF7TT_SALINE_RIG2_POST_DARKNESSmaps.mat';
% files(n).darknessdata = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_POST_DARKNESS\112917_G62FFF7TT_SALINE_RIG2_POST_DARKNESS';
% files(n).patchonpatch =  '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_POST_PATCHONPATCH\112917_G62FFF7TT_SALINE_RIG2_POST_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '112917_G62FFF7TT_SALINE_RIG2\112917_G62FFF7TT_SALINE_RIG2_POST_PATCHONPATCH\112917_G62FFF7TT_SALINE_RIG2_POST_PATCHONPATCH';
% files(n).inject = 'saline';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'post';
% files(n).patchpts = '112917_G62FFF7TT_SALINE_RIG2\G62FFF7TTpatchpts.mat';
% files(n).circpts = '112917_G62FFF7TT_SALINE_RIG2\G62FFF7TTcircpts.mat';
% 
% %%
% n=n+1;
% files(n).subj = 'G6H3.1LT';
% files(n).expt = '112917';
% files(n).topox= '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_TOPOX\112917_G6H3.1LT_DOI_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_TOPOX\112917_G6H3.1LT_DOI_RIG2_TOPOX';
% files(n).topoy = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_TOPOY\112917_G6H3.1LT_DOI_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_TOPOY\112917_G6H3.1LT_DOI_RIG2_TOPOY';
% files(n).darkness =  '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_PRE_DARKNESS\112917_G6H3.1LT_DOI_RIG2_PRE_DARKNESSmaps.mat';
% files(n).darknessdata = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_PRE_DARKNESS\112917_G6H3.1LT_DOI_RIG2_PRE_DARKNESS';
% files(n).patchonpatch =  '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_PRE_PATCHONPATCH\112917_G6H3.1LT_DOI_RIG2_PRE_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_PRE_PATCHONPATCH\112917_G6H3.1LT_DOI_RIG2_PRE_PATCHONPATCH';
% files(n).inject = 'doi';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'pre';
% files(n).patchpts = '112917_G6H3.1LT_DOI_RIG2\G6H3.1LTpatchpts.mat';
% files(n).circpts = '112917_G6H3.1LT_DOI_RIG2\G6H3.1LTcircpts.mat';
% 
% n=n+1;
% files(n).subj = 'G6H3.1LT';
% files(n).expt = '112917';
% files(n).topox= '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_TOPOX\112917_G6H3.1LT_DOI_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_TOPOX\112917_G6H3.1LT_DOI_RIG2_TOPOX';
% files(n).topoy = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_TOPOY\112917_G6H3.1LT_DOI_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_TOPOY\112917_G6H3.1LT_DOI_RIG2_TOPOY';
% files(n).darkness =  '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_POST_DARKNESS\112917_G6H3.1LT_DOI_RIG2_POST_DARKNESSmaps.mat';
% files(n).darknessdata = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_POST_DARKNESS\112917_G6H3.1LT_DOI_RIG2_POST_DARKNESS';
% files(n).patchonpatch =  '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_POST_PATCHONPATCH\112917_G6H3.1LT_DOI_RIG2_POST_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '112917_G6H3.1LT_DOI_RIG2\112917_G6H3.1LT_DOI_RIG2_POST_PATCHONPATCH\112917_G6H3.1LT_DOI_RIG2_POST_PATCHONPATCH';
% files(n).inject = 'doi';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'post';
% files(n).patchpts = '112917_G6H3.1LT_DOI_RIG2\G6H3.1LTpatchpts.mat';
% files(n).circpts = '112917_G6H3.1LT_DOI_RIG2\G6H3.1LTcircpts.mat';
% 
% %%
% n=n+1;
% files(n).subj = 'G62QQ10LT';
% files(n).expt = '113017';
% files(n).topox= '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOX\113017_G62QQ10LT_SALINE_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOX\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOX';
% files(n).topoy = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOY\113017_G62QQ10LT_SALINE_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOY\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOY';
% files(n).darkness =  '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_DARKNESS\113017_G62QQ10LT_SALINE_RIG2_PRE_DARKNESSmaps.mat';
% files(n).darknessdata = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_DARKNESS\113017_G62QQ10LT_SALINE_RIG2_PRE_DARKNESS';
% files(n).patchonpatch =  '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_PATCHONPATCH\113017_G62QQ10LT_SALINE_RIG2_PRE_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_PATCHONPATCH\113017_G62QQ10LT_SALINE_RIG2_PRE_PATCHONPATCH';
% files(n).inject = 'saline';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'pre';
% files(n).patchpts = '113017_G62QQ10LT_SALINE_RIG2\G62QQ10LTpatchpts.mat';
% files(n).circpts = '113017_G62QQ10LT_SALINE_RIG2\G62QQ10LTcircpts.mat';
% 
% n=n+1;
% files(n).subj = 'G62QQ10LT';
% files(n).expt = '113017';
% files(n).topox= '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOX\113017_G62QQ10LT_SALINE_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOX\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOX';
% files(n).topoy = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOY\113017_G62QQ10LT_SALINE_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOY\113017_G62QQ10LT_SALINE_RIG2_PRE_TOPOY';
% files(n).darkness =  '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_POST_DARKNESS\113017_G62QQ10LT_SALINE_RIG2_POST_DARKNESSmaps.mat';
% files(n).darknessdata = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_POST_DARKNESS\113017_G62QQ10LT_SALINE_RIG2_POST_DARKNESS';
% files(n).patchonpatch =  '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_POST_PATCHONPATCH\113017_G62QQ10LT_SALINE_RIG2_POST_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '113017_G62QQ10LT_SALINE_RIG2\113017_G62QQ10LT_SALINE_RIG2_POST_PATCHONPATCH\113017_G62QQ10LT_SALINE_RIG2_POST_PATCHONPATCH';
% files(n).inject = 'saline';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'post';
% files(n).patchpts = '113017_G62QQ10LT_SALINE_RIG2\G62QQ10LTpatchpts.mat';
% files(n).circpts = '113017_G62QQ10LT_SALINE_RIG2\G62QQ10LTcircpts.mat';
% 
% %%
% n=n+1;
% files(n).subj = 'G62QQ10LN';
% files(n).expt = '120117';
% files(n).topox= '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOX\120117_G62QQ10LN_DOI_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOX\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOX';
% files(n).topoy = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOY\120117_G62QQ10LN_DOI_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOY\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOY';
% files(n).darkness =  '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_DARKNESS\120117_G62QQ10LN_DOI_RIG2_PRE_DARKNESSmaps.mat';
% files(n).darknessdata = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_DARKNESS\120117_G62QQ10LN_DOI_RIG2_PRE_DARKNESS';
% files(n).patchonpatch =  '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_PATCHONPATCH\120117_G62QQ10LN_DOI_RIG2_PRE_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_PATCHONPATCH\120117_G62QQ10LN_DOI_RIG2_PRE_PATCHONPATCH';
% files(n).inject = 'doi';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'pre';
% files(n).patchpts = '120117_G62QQ10LN_DOI_RIG2\G62QQ10LNpatchpts.mat';
% files(n).circpts = '120117_G62QQ10LN_DOI_RIG2\G62QQ10LNcircpts.mat';
% 
% n=n+1;
% files(n).subj = 'G62QQ10LN';
% files(n).expt = '120117';
% files(n).topox= '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOX\120117_G62QQ10LN_DOI_RIG2_TOPOXmaps.mat';
% files(n).topoxdata = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOX\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOX';
% files(n).topoy = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOY\120117_G62QQ10LN_DOI_RIG2_TOPOYmaps.mat';
% files(n).topoydata = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOY\120117_G62QQ10LN_DOI_RIG2_PRE_TOPOY';
% files(n).darkness =  '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_POST_DARKNESS\120117_G62QQ10LN_DOI_RIG2_POST_DARKNESSmaps.mat';
% files(n).darknessdata = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_POST_DARKNESS\120117_G62QQ10LN_DOI_RIG2_POST_DARKNESS';
% files(n).patchonpatch =  '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_POST_PATCHONPATCH\120117_G62QQ10LN_DOI_RIG2_POST_PATCHONPATCHmaps.mat';
% files(n).patchonpatchdata = '120117_G62QQ10LN_DOI_RIG2\120117_G62QQ10LN_DOI_RIG2_POST_PATCHONPATCH\120117_G62QQ10LN_DOI_RIG2_POST_PATCHONPATCH';
% files(n).inject = 'doi';
% files(n).training = 'naive';
% files(n).rignum = 'rig2';
% files(n).monitor = 'landscape';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'good darkness and stimulus';
% files(n).timing = 'post';
% files(n).patchpts = '120117_G62QQ10LN_DOI_RIG2\G62QQ10LNpatchpts.mat';
% files(n).circpts = '120117_G62QQ10LN_DOI_RIG2\G62QQ10LNcircpts.mat';

%%
n=n+1;
files(n).subj = 'G6H3.3TT';
files(n).expt = '120617';
files(n).topox= '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOX\120617_G62H3.3TT_SALINE_RIG2_TOPOXmaps.mat';
files(n).topoxdata = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOX\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOX';
files(n).topoy = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOY\120617_G62H3.3TT_SALINE_RIG2_TOPOYmaps.mat';
files(n).topoydata = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOY\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOY';
files(n).darkness =  '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_DARKNESS\120617_G62H3.3TT_SALINE_RIG2_PRE_DARKNESSmaps.mat';
files(n).darknessdata = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_DARKNESS\120617_G62H3.3TT_SALINE_RIG2_PRE_DARKNESS';
files(n).patchonpatch =  '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_PATCHONPATCH\120617_G62H3.3TT_SALINE_RIG2_PRE_PATCHONPATCHmaps.mat';
files(n).patchonpatchdata = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_PATCHONPATCH\120617_G62H3.3TT_SALINE_RIG2_PRE_PATCHONPATCH';
files(n).inject = 'saline';
files(n).training = 'naive';
files(n).rignum = 'rig2';
files(n).monitor = 'landscape';
files(n).label = 'camk2 gc6';
files(n).notes = 'good darkness and stimulus';
files(n).timing = 'pre';
files(n).patchpts = '120617_G62H3.3TT_SALINE_RIG2\G62H3.3TTpatchpts.mat';
files(n).circpts = '120617_G62H3.3TT_SALINE_RIG2\G62H3.3TTcircpts.mat';

n=n+1;
files(n).subj = 'G6H3.3TT';
files(n).expt = '120617';
files(n).topox= '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOX\120617_G62H3.3TT_SALINE_RIG2_TOPOXmaps.mat';
files(n).topoxdata = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOX\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOX';
files(n).topoy = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOY\120617_G62H3.3TT_SALINE_RIG2_TOPOYmaps.mat';
files(n).topoydata = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOY\120617_G62H3.3TT_SALINE_RIG2_PRE_TOPOY';
files(n).darkness =  '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_POST_DARKNESS\120617_G62H3.3TT_SALINE_RIG2_POST_DARKNESSmaps.mat';
files(n).darknessdata = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_POST_DARKNESS\120617_G62H3.3TT_SALINE_RIG2_POST_DARKNESS';
files(n).patchonpatch =  '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_POST_PATCHONPATCH\120617_G62H3.3TT_SALINE_RIG2_POST_PATCHONPATCHmaps.mat';
files(n).patchonpatchdata = '120617_G62H3.3TT_SALINE_RIG2\120617_G62H3.3TT_SALINE_RIG2_POST_PATCHONPATCH\120617_G62H3.3TT_SALINE_RIG2_POST_PATCHONPATCH';
files(n).inject = 'saline';
files(n).training = 'naive';
files(n).rignum = 'rig2';
files(n).monitor = 'landscape';
files(n).label = 'camk2 gc6';
files(n).notes = 'good darkness and stimulus';
files(n).timing = 'post';
files(n).patchpts = '120617_G62H3.3TT_SALINE_RIG2\G62H3.3TTpatchpts.mat';
files(n).circpts = '120617_G62H3.3TT_SALINE_RIG2\G62H3.3TTcircpts.mat';
