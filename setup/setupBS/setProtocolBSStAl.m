function r = setProtocolBSStAl(r,subjIDs)
%% Check for basics
if ~isa(r,'ratrix')
    error('need a ratrix')
end

if ~all(ismember(subjIDs,getSubjectIDs(r)))
    error('not all those subject IDs are in that ratrix')
end

%% Create Sound Manager
sm=makeStandardSoundManager();

%% Reward Manager
rewardSizeULorMS          =50;
requestRewardSizeULorMS   =10;
requestMode               ='first';
msPenalty                 =1000;
fractionOpenTimeSoundIsOn =1;
fractionPenaltySoundIsOn  =1;
scalar                    =1;
msAirpuff                 =msPenalty;

constantRewards=constantReinforcement(rewardSizeULorMS,requestRewardSizeULorMS,requestMode,msPenalty,fractionOpenTimeSoundIsOn,fractionPenaltySoundIsOn,scalar,msAirpuff);

allowRepeats=false;
freeDrinkLikelihood=0.003;
fd = freeDrinks(sm,freeDrinkLikelihood,allowRepeats,constantRewards);

freeDrinkLikelihood=0;
fd2 = freeDrinks(sm,freeDrinkLikelihood,allowRepeats,constantRewards);

percentCorrectionTrials=.5;

maxWidth               = 800;
maxHeight              = 600;

%% Eyetrack
eyetrack=false;
if eyetrack
    alpha=12; %deg above...really?
    beta=0;   %deg to side... really?
    settingMethod='none';  % will run with these defaults without consulting user, else 'guiPrompt'
    eyeTracker=geometricTracker('cr-p', 2, 3, alpha, beta, int16([1280,1024]), [42,28], int16([maxWidth,maxHeight]), [400,290], 300, -55, 0, 45, 0,settingMethod,10000);
else
    eyeTracker=[];
end
eyeController=[];


%% DataNet
dataNetOn=false;
if dataNetOn
    ai_parameters.numChans=3;
    ai_parameters.sampRate=40000;
    ai_parameters.inputRanges=repmat([-1 6],ai_parameters.numChans,1);
    dn=datanet('stim','localhost','132.239.158.179','\\132.239.158.179\datanet_storage',ai_parameters)
else
    dn=[];
end

%% Start Creating Trial Managers

%% Vertical Horizontal Discrimination
% {'flickerRamp',[0 .5]}
dropFrames=false;
vh=nAFC(sm,percentCorrectionTrials,constantRewards,eyeController,{'off'},dropFrames,'ptb','center');

%% Oriented Grating autopilot
showText = true;
og=autopilot(percentCorrectionTrials,sm,constantRewards,eyeController,{'off'}, dropFrames,'ptb','center',[],[],[],showText); 

%% Start Creating Stim Managers

%% Oriented Gabors
pixPerCycs              =[20];
targetOrientations      =[pi/4 5*pi/4];
distractorOrientations  =[];
mean                    =.5;
radius                  =.04;
contrast                =1;
thresh                  =.00005;
yPosPct                 =.65;
%screen('resolutions') returns values too high for our NEC MultiSync FE992's -- it must just consult graphics card
scaleFactor            = 0; %[1 1];
interTrialLuminance     =.5;
freeStim = orientedGabors(pixPerCycs,targetOrientations,distractorOrientations,mean,radius,contrast,thresh,yPosPct,maxWidth,maxHeight,scaleFactor,interTrialLuminance);

pixPerCycs=[20];
distractorOrientations=[];
discrimStim = orientedGabors(pixPerCycs,targetOrientations,distractorOrientations,mean,radius,contrast,thresh,yPosPct,maxWidth,maxHeight,scaleFactor,interTrialLuminance);

%% Image Stimului
ims=fullfile('Rodent-Data','PriyaV','other stimuli sets','paintbrush_flashlight'); %'\\Reinagel-lab.ad.ucsd.edu\rlab\Rodent-Data\PriyaV\other stimuli sets\paintbrushMORPHflashlightEDF';
if ispc
    imageDir=fullfile('\\Reinagel-lab.ad.ucsd.edu','rlab',ims);
elseif ismac
    targ='/Volumes/rlab';
    loc='@132.239.158.181/rlab ';
    
    [stat res]=system('mount');
    if stat==0
        if isempty(findstr(res,sprintf('%son %s',loc,targ)))
            
            [status,message,messageid] = mkdir(targ);
            if status
                [stat res]=system(sprintf('mount -o nodev,nosuid -t smbfs //rodent:1Mouse%s %s',loc,targ));
                if stat~=0
                    stat
                    res
                    error('couldn''t mount rlab')
                end
            else
                targ
                message
                messageid
                error('couldn''t mkdir')
            end
        end
    else
        stat
        res
        error('couldn''t check mounts')
    end
    imageDir=fullfile(targ,ims);
else
    error('only works on windows and mac')
end

background=0;
ypos=0;
ims=dir(fullfile(imageDir,'*.png'));
if isempty(ims)
    error('couldn''t find image directory')
end

trialDistribution={};
for i=1:floor(length(ims)/2)
    [junk n1 junk junk]=fileparts(ims(i).name);
    [junk n2 junk junk]=fileparts(ims(length(ims)-(i-1)).name);
    trialDistribution{end+1}={{n1 n2} 1};
end
imageStim = images(imageDir,ypos,background,maxWidth,maxHeight,scaleFactor,interTrialLuminance,trialDistribution,'normal',[1 1],false,[0 0],false,.5);

d=2; %decrease to broaden
gran=100;
x=linspace(-d,d,gran);
[a b]=meshgrid(x);

%% Oriented Grating Stimulus
driftFrequencies = [-5 5];
Orientation = [0:pi/12:pi];
Phase = [0];
Contrast = logspace(0,-1,3);
Duration = [1];
Radii = [1];
Annuli = [0];
Location = [0.5 0.5];
Waveform = 'sine';
normalizationMethod = 'normalizeDiagonal';
mean = [0.5];
thresh = [0.85];
numRepeats = [1];
doCombos = 'true';
gratingStim = gratings(pixPerCycs,driftFrequencies,Orientation,Phase,Contrast,Duration,Radii,Annuli,Location,Waveform,...
    normalizationMethod,mean,thresh,numRepeats,maxWidth,maxHeight,scaleFactor,interTrialLuminance, doCombos);

%% Noise Stimuli
ports=cellfun(@uint8,{1 3},'UniformOutput',false);
[noiseSpec(1:length(ports)).port]=deal(ports{:});

% stim properties:
% in.distribution               'binary', 'uniform', or one of the following forms:
%                                   {'sinusoidalFlicker',[temporalFreqs],[contrasts],gapSecs} - each freq x contrast combo will be shown for equal time in random order, total time including gaps will be in.loopDuration
%                                   {'gaussian',clipPercent,seed} - choose variance so that clipPercent of an infinite stim would be clipped (includes both low and hi)
%                                           seed - either 'new' or scalar integer 0-2^32-1
%                                   {path, origHz, clipVal, clipType} - path is to a file (either .txt or .mat, extension omitted, .txt loadable via load()) containing a single vector of stim values named 'noise', with original sampling rate origHz.
%                                       clipType:
%                                       'normalized' will normalize whole file to clipVal (0-1), setting darkest val in file to 0 and values over clipVal to 1.
%                                       'ptile' will normalize just the contiguous part of the file you are using to 0-1, clipping top clipVal (0-1) proportion of vals (considering only the contiguous part of the file you are using)
% in.startFrame                 'randomize' or integer indicating fixed frame number to start with
% in.loopDuration               in seconds (will be rounded to nearest multiple of frame duration, if distribution is a file, pass 0 to loop the whole file)
%                               to make uniques and repeats, pass {numRepeats numUniques numCycles chunkSeconds centerThirdContrasts} - chunk refers to one repeat/unique - distribution cannot be sinusoidalFlicker
%                                        centerThirdContrasts -- a vector of contrast values -1 to 1 to loop over, setting center 1/3 of each chunk
% in.numLoops                   must be >0 or inf, fractional values ok (will be rounded to nearest frame)

[noiseSpec.distribution]         =deal({'gaussian' .01 'new'});
[noiseSpec.startFrame]           =deal(uint8(1)); %deal('randomize');
[noiseSpec.loopDuration]         =deal(1);
[noiseSpec.numLoops]             =deal(inf);

% patch properties:
% in.locationDistribution       2-d density, will be normalized to stim area
% in.maskRadius                 std dev of the enveloping gaussian, normalized to diagonal of stim area (values <=0 mean no mask)
% in.patchDims                  [height width]
% in.patchHeight                0-1, normalized to stim area height
% in.patchWidth                 0-1, normalized to stim area width
% in.background                 0-1, normalized (luminance outside patch)

[noiseSpec.locationDistribution]=deal(reshape(mvnpdf([a(:) b(:)],[-d/2 d/2]),gran,gran),reshape(mvnpdf([a(:) b(:)],[d/2 d/2]),gran,gran));
[noiseSpec.maskRadius]           =deal(0.06);%.045);
[noiseSpec.patchDims]            =deal(uint16([50 50]));
[noiseSpec.patchHeight]          =deal(.4);
[noiseSpec.patchWidth]           =deal(.4);
[noiseSpec.background]           =deal(.5);

% filter properties:
% in.orientation                filter orientation in radians, 0 is vertical, positive is clockwise
% in.kernelSize                 0-1, normalized to diagonal of patch
% in.kernelDuration             in seconds (will be rounded to nearest multiple of frame duration)
% in.ratio                      ratio of short to long axis of gaussian kernel (1 means circular, no effective orientation)
% in.filterStrength             0 means no filtering (kernel is all zeros, except 1 in center), 1 means pure mvgaussian kernel (center not special), >1 means surrounding pixels more important
% in.bound                      .5-1 edge percentile for long axis of kernel when parallel to window

[noiseSpec.orientation]         =deal(-pi/4,pi/4);
[noiseSpec.kernelSize]           =deal(.5);
[noiseSpec.kernelDuration]       =deal(.2);
[noiseSpec.ratio]                =deal(1/3);
[noiseSpec.filterStrength]       =deal(1);
[noiseSpec.bound]                =deal(.99);

noiseStim=filteredNoise(noiseSpec,maxWidth,maxHeight,scaleFactor,interTrialLuminance);

[noiseSpec.orientation]         =deal(0);
[noiseSpec.locationDistribution]=deal([0 0;1 0], [0 0;0 1]);
[noiseSpec.distribution]         =deal('binary');
[noiseSpec.maskRadius]           =deal(100);
[noiseSpec.kernelSize]           =deal(0);
[noiseSpec.kernelDuration]       =deal(0);
[noiseSpec.ratio]                =deal(1);
[noiseSpec.filterStrength]       =deal(0);
[noiseSpec.patchDims]            =deal(uint16([2 2]));
[noiseSpec.patchHeight]          =deal(.1);
[noiseSpec.patchWidth]           =deal(.1);

unfilteredNoise=filteredNoise(noiseSpec,maxWidth,maxHeight,scaleFactor,interTrialLuminance);


[a b]=getMACaddress;
if ispc
    x=daqhwinfo('nidaq');
else
    x.InstalledBoardIds=[];
end
if a && ismember(b,{'0014225E4685','0018F35DF141'}) && length(x.InstalledBoardIds)>0
    led=nAFC(sm,percentCorrectionTrials,constantRewards,eyeController,{'off'},false,'LED','center');
else
    led=vh;
end

if ismac
    ts001 = '/Users/eflister/Desktop/ratrix trunk/classes/protocols/stimManagers/@flicker/ts001';
else
    ts001 = '\\Reinagel-lab.ad.ucsd.edu\rlab\Rodent-Data\stimuli\hateren\ts001';
end

[noiseSpec.distribution]         =deal({ts001, 1200, .01, 'ptile'}); %12800/32767 for normalized clipVal, see pam email to Alex Casti on January 25, 2005, and Reinagel Reid 2000
[noiseSpec.loopDuration]         =deal({uint32(60) uint32(0) uint32(1) uint32(30) 1}); %{numRepeats numUniques numCycles chunkSeconds centerThirdContrasts}


[noiseSpec.locationDistribution]=deal(1);
[noiseSpec.patchDims]            =deal(uint16([1 1]));
[noiseSpec.patchHeight]          =deal(1);
[noiseSpec.patchWidth]           =deal(1);

hateren=filteredNoise(noiseSpec,maxWidth,maxHeight,scaleFactor,interTrialLuminance);

[noiseSpec.distribution]         =deal({'gaussian', .01, uint32(12345)});
nr=60;
[noiseSpec.loopDuration]         =deal({uint32(nr) uint32(0) uint32(1) uint32(30) linspace(1,-1,nr)}); %{numRepeats numUniques numCycles chunkSeconds centerThirdContrasts}

fullfieldFlicker=filteredNoise(noiseSpec,maxWidth,maxHeight,scaleFactor,interTrialLuminance);

tfs=[1 5 10 25 50];
cs=[.1 .25 .5 .75 1];
[noiseSpec.distribution]         =deal({'sinusoidalFlicker',tfs,cs,.1}); %temporal freqs, contrasts, gapSecs
[noiseSpec.loopDuration]         =deal(length(cs)*length(tfs)*4);
[noiseSpec.patchHeight]          =deal(1);
[noiseSpec.patchWidth]           =deal(1);
crftrf=filteredNoise(noiseSpec,maxWidth,maxHeight,scaleFactor,interTrialLuminance);

tfs=[1 5 7 10 15 25 50];
cs=[1];
[noiseSpec.distribution]         =deal({'squareFlicker',tfs,cs,0.2}); %temporal freqs, contrasts, gapSecs
[noiseSpec.loopDuration]         =deal(length(cs)*length(tfs)*1);
search=filteredNoise(noiseSpec,maxWidth,maxHeight,scaleFactor,interTrialLuminance);
%% Svn check
svnRev={'svn://132.239.158.177/projects/ratrix/trunk'};
svnCheckMode='session';

%% Define trainingStep
ts1 = trainingStep(vh, noiseStim,  repeatIndefinitely(), noTimeOff(), svnRev,svnCheckMode); %filteredNoise discrim
ts2 = trainingStep(vh, unfilteredNoise,  repeatIndefinitely(), noTimeOff(), svnRev,svnCheckMode); %unfiltered goToSide
ts3 = trainingStep(vh, hateren,  repeatIndefinitely(), noTimeOff(), svnRev,svnCheckMode); %filteredNoise discrim
ts4 = trainingStep(vh, fullfieldFlicker,  repeatIndefinitely(), noTimeOff(), svnRev,svnCheckMode); %unfiltered goToSide
ts5 = trainingStep(led, hateren,  repeatIndefinitely(), noTimeOff(), svnRev,svnCheckMode); %hateren
ts6 = trainingStep(led, fullfieldFlicker,  repeatIndefinitely(), noTimeOff(), svnRev,svnCheckMode); %fullfieldFlicker
ts7 = trainingStep(led, crftrf,  repeatIndefinitely(), noTimeOff(), svnRev,svnCheckMode); %crf/trf
ts8 = trainingStep(og, gratingStim, repeatIndefinitely(), noTimeOff(), svnRev,svnCheckMode); %grating stim

%% Create protocol
p=protocol('gabor test',{ts1, ts2, ts3, ts4, ts5, ts6});
stepNum=uint8(4); % Which stepNum to start at

for i=1:length(subjIDs),
    subj=getSubjectFromID(r,subjIDs{i});
    [subj r]=setProtocolAndStep(subj,p,true,false,true,stepNum,r,'call to setProtocolBSAnesth','bs');
end