function r = setProtocolGTS(r,subjIDs)

if ~isa(r,'ratrix')
    error('need a ratrix')
end

if ~all(ismember(subjIDs,getSubjectIDs(r)))
    error('not all those subject IDs are in that ratrix')
end

sm=makeStandardSoundManager();

rewardSizeULorMS          =75;
requestRewardSizeULorMS   =0;
requestMode               ='first';
msPenalty                 =3500;          %consider changing this also in future
fractionOpenTimeSoundIsOn =1;
fractionPenaltySoundIsOn  =1;
scalar                    =1;
msAirpuff                 =0;
pixPerCycs                = [200]; %*10^9;
%stim.stopHUD = false; %stop period heads up display... false = off
percentCorrectionTrials = .5;
stim.gain = 0.7 * ones(2,1);


% sca
% keyboard

%if ~isscalar(subjIDs)
    %error('expecting exactly one subject')
%end

switch subjIDs{1}
    
        
    case 'pvarch515rt'  %started 9/27/17; 11/7/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         percentCorrectionTrials = .5;  
    
    
    case 'pvarch515lt'  %started 9/27/17 %% 10/23/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         percentCorrectionTrials = .5;  
    
    case 'pvchr4b16rt'  %started 5/26/17, 9/4/17
        requestRewardSizeULorMS = 0;
        rewardSizeULorMS        = 219;   
        msPenalty               =3500;
        percentCorrectionTrials = .5;
        
    case 'pvchr4b16nt'  %started 5/26/17 started 8/4/17
        requestRewardSizeULorMS = 0;
        rewardSizeULorMS        = 219;
        msPenalty               =3500;
        percentCorrectionTrials = .5;
        
        
    case 'pvchr4b16lt'  %started 5/26/17 started 8/4/17
        requestRewardSizeULorMS = 0;
        rewardSizeULorMS        = 219;
        msPenalty               =3500;
        percentCorrectionTrials = .5;
        
    case 'pvchr4b14rt'  %started 4/26/17. started 5/17/17
        requestRewardSizeULorMS = 0;
        rewardSizeULorMS        = 219;
        msPenalty               =3500;
        percentCorrectionTrials = .5;
    
    case 'pvchr4b14nt'  %started 4/26/17.  started 5/15/17.
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         percentCorrectionTrials = .5; 
    
    case 'pvchr4b14tt'  %started 4/27/17 %%start gts 5/10/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         percentCorrectionTrials = .5; 
         
%     case 'pvchr4b14lt'  %started 4/27/17 %%start gts 5/8/17
%          requestRewardSizeULorMS = 0;
%          rewardSizeULorMS        = 219;
%          msPenalty               =3500;
%          percentCorrectionTrials = .5;     
%     
%     case 'pvchr238'  %started 3/6/17 started 4/17/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5; 
%     
%     case 'pvchr4b8tt' %started 2/16/17 started 3/14/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5; 
    
    case 'pvchr4b4nt' %started 1/23/17  started gts 2/15/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .75; 
  
   case 'pvchr4b4rt' %started 1/23/17  started gts 2/15/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5; 
    
   case 'pvchr4b4lt' %started 1/23/17  started gts 2/15/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5; 
    
   case 'pvchr4b3rt' %started 1/23/17  started gts 2/15/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5;  
    
   case 'pvchr4b3tt' %started 1/23/17  started gts 2/15/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5; 
  
    
    case 'pvchr4b1rt' % Started 2/1/17 %%start gts 2/13/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5;      

   case 'pvchr4b1lt' % Started 2/1/17 %%start gts 2/13/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5;      
    
   case 'pvchr4b2ln' % Started 2/1/17 %%start gts 2/13/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5;      
    
   case 'pvchr4b2tt' % Started 2/1/17 %%start gts 2/13/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5;      
    
  case 'pvchr3b15rt' %% Started 9/9/16 %%start gts 9/22/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5;       
    
    case 'pvchr3b15lt' % Started 9/9/16 %%start gts 9/22/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .75;   
     
    case 'pvchr3b14tt' % Started 9/9/16 %%start gts 9/22/16
       requestRewardSizeULorMS = 0; 
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .75;  
       
    case 'pvchr3b14rt' % Start GTS 2/9/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5;   
       
    case 'pvchr3b14lt' % Started 9/9/16 %%start gts 9/22/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .75;
    
    
   case 'g62gg10lt' % Started 7/20/16 %%start gts 8/2/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5;    
    
   case 'g62ll3rt' % Started 5/30/16 %sent back 7/5/16 %%switch gts 7/23/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .5;  
       
       
%    case 'g62gg7lt' % Started 5/12/16 %%started gts 5/23/16
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .75;        
%   
   case 'g62ff6lt' % Started 4/13/16 
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 123;
       msPenalty               =3500;
       percentCorrectionTrials = .75; 
    
   case 'g62gg5rt' % Started 4/13/16 
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 59;
       msPenalty               =3500;
       percentCorrectionTrials = .8;
       
   case 'g62bb10lt' % Started 4/13/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 59;
       msPenalty               =3500;
       percentCorrectionTrials = .7;
   
    
   case 'g62ff4lt' % Started 4/13/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 123;
       msPenalty               =3500;
       percentCorrectionTrials = .75;
       stim.gain = 0.60 * ones(2,1); %try this since has trouble fully stopping; 4/25/16
 
    
   case 'g62tx2.14rt' % Started 4/13/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 123;
       msPenalty               =3500;
       percentCorrectionTrials = .7;

    
   case 'g62dd6lt' % Started 4/13/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 123;
       msPenalty               =3500;
       percentCorrectionTrials = .75;

    
   case 'g62dd5' % Started 2/29/16 %back to GoToBlack 4/2/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 139;
       msPenalty               =3500;
       percentCorrectionTrials = .7;     


   case 'g62ff5lt' % Started 3/9/16  %GTS started 3/20/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 155;
       msPenalty               =3500;
       percentCorrectionTrials = .75; 
       stim.gain = 0.60 * ones(2,1); %try this since has trouble fully stopping; 4/25/16
        
       
    
   case 'g62dd2ln' % Started 1/26/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 123;
       msPenalty               =3500;
       percentCorrectionTrials = .5; 
       
 
    
   case 'g62y3lt' % Started 1/12/16 switch to GTS 1/29/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 59;
       msPenalty               =3500;
       percentCorrectionTrials = .5;    
    
    
   case 'g62tx1.5lt' % Started 1/12/16
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 59;
       msPenalty               =3500;
       percentCorrectionTrials = .5;
      



    
         
    otherwise
        warning('unrecognized mouse, using defaults')
end

noRequest = constantReinforcement(rewardSizeULorMS,requestRewardSizeULorMS,requestMode,msPenalty,fractionOpenTimeSoundIsOn,fractionPenaltySoundIsOn,scalar,msAirpuff);



maxWidth  = 1920;
maxHeight = 1080;

[w,h] = rat(maxWidth/maxHeight);
textureSize = 10*[w,h];
zoom = [maxWidth maxHeight]./textureSize;

svnRev = {}; %{'svn://132.239.158.177/projects/ratrix/trunk'};
svnCheckMode = 'session';

interTrialLuminance = .5;


stim.targetDistance = 500 * ones(1,2);
stim.timeoutSecs = 10;
stim.slow = [40; 80]; % 10 * ones(2,1);
stim.slowSecs = 1;
stim.positional = false;
stim.cue = true;
stim.soundClue = false;

targetOrientations     = [0 1]*pi/2;
distractorOrientations = []; %-targetOrientations;
mean                   = .5;
radius                 = .25;
contrast               = 1;
thresh                 = .00005;
yPosPct                = .5;
stim.stim = orientedGabors(pixPerCycs,targetOrientations,distractorOrientations,mean,radius,contrast,thresh,yPosPct,maxWidth,maxHeight,zoom,interTrialLuminance);


%stim to stay on 1 sec after answer
ballSM = setReinfAssocSecs(trail(stim,maxWidth,maxHeight,zoom,interTrialLuminance),1);



ballTM = ball(percentCorrectionTrials,sm,noRequest);
ts1 = trainingStep(ballTM, ballSM, repeatIndefinitely(), noTimeOff(), svnRev, svnCheckMode); %ball

p=protocol('mouse',{ts1});

stepNum=uint8(1);
subj=getSubjectFromID(r,subjIDs{1});
[subj r]=setProtocolAndStep(subj,p,true,false,true,stepNum,r,'LY01 (40,80), R=36','edf');
end