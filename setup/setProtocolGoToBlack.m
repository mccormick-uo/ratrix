function r = setProtocolGoToBlack(r,subjIDs)

if ~isa(r,'ratrix')
    error('need a ratrix')
end

if ~all(ismember(subjIDs,getSubjectIDs(r)))
    error('not all those subject IDs are in that ratrix')
end

sm=makeStandardSoundManager();

rewardSizeULorMS          =120;
requestRewardSizeULorMS   =0;
requestMode               ='first';
msPenalty                 =3500;       %consider changing this also in future
fractionOpenTimeSoundIsOn =1;
fractionPenaltySoundIsOn  =1;
scalar                    =1;
msAirpuff                 =0;
stim.slowSecs = 1;

percentCorrectionTrials = .5;


switch subjIDs{1}
    
       
    case 'testgotoblackstopime' % Started 6/25/15
       requestRewardSizeULorMS = 20;
       rewardSizeULorMS        = 107;
       msPenalty               =3500;
       percentCorrectionTrials = .5;
       stim.slowSecs = 1;
       
%     case 'g62w7ln' % Started 11/2/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 

   case 'g62tx2.8lt' % Started 11/16/15
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 123;
       msPenalty               =3500;
       percentCorrectionTrials = .5; 
       
   case 'g62cc2lt' % Started 11/16/15
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 123;
       msPenalty               =3500;
       percentCorrectionTrials = .5; 
       
    case 'g62r9tt' % Started 10/12/15 %%started gts 10/24/15 %%%back gotoblack 11/5/15
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 107;
       msPenalty               =3500;
       percentCorrectionTrials = .5; 
       
    
%     case 'g62w7tt' % Started 11/2/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
       
    case 'pvchr14ln' % Started 8/25/15 %%started hvv center 9/15/15 %%% ALL PV14 mice back to gotoblack 10/29/15 
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 59;
       msPenalty               =6500;
       percentCorrectionTrials = .50; 
       stim.slowSecs = 2;
       
    case 'pvchr14rn' % Started 8/25/15 %%started hvv center 9/15/15
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 43;
       msPenalty               =6500;
       percentCorrectionTrials = .50; 
       stim.slowSecs = 2;

       
    case 'pvchr14rt' % Started 8/25/15 %%switched to center 9/11/15
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 27;
       msPenalty               =5500;
       percentCorrectionTrials = .50; 
       stim.slowSecs = 1.5;
       
    case 'pvchr14tt' % Started 8/25/15 %%switched to center 9/11/15
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 43;
       msPenalty               =4500;
       percentCorrectionTrials = .50; 
       stim.slowSecs = 2;

       
%     case 'g62tx2.3ln' % Started 10/24/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
    
%     case 'g62tx2.3rt' % Started 10/24/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
    
%     case 'g62tx1.2lt' % Started 10/24/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
    
%     case 'g62tx1.1ln' % Started 10/15/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
    
%     case 'g62tx1.1tt' % Started 10/15/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
       
%     case 'g62r9tt' % Started 10/12/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
       
%     case 'g62x1rt' % Started 10/8/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
       
%     case 'g62t6lt' % Started 9/18/15 %%switch hvv center 10/13/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
       
%     case 'g6w4tt' % Started 9/15/15 %switch to GTS on 10/4/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5; 
       
%     case 'g62t5rt' % Started 9/11/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
%        

%     case 'pvchr14rt' % Started 8/25/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
%        
%     case 'pvchr14tt' % Started 8/25/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
       
%     case 'pvchr14ln' % Started 8/25/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 
%        
%     case 'pvchr14rn' % Started 8/25/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 107;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50; 



       
    
%     case 'g62a5nn' % Started 5/15/15 %% back to gotoblack 7/14/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 16;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50;
    
%     case 'g62r3rt' % Started 5/18/15 %% back to gotoblack 7/14/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 16;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
     
   
        
    
%      case 'g62a3tt' % Started 6/25/15 %% started hvv 7/17/15 %%started gotoblack again 8/11/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 43;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%        
%     case 'g62a2nn' % Started 6/25/15 (permenant record wont show till 6/26/15) %%Started hvv 7/14/15 %%started gotoblack 8/11/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 43;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
    
%     case 'g62a5nn' % Started 5/15/15 %% back to hvv 7/25/15 %%backtogloblack 8/11/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 43;
%        msPenalty               =3500;
%        percentCorrectionTrials = .50;
    
%     case 'pv8lt' % Started 6/25/15  (permenant record wont show till 6/26/15) %%started center 7/14/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 43;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%        stim.slowSecs = 1;
%     
%     case 'pv8nt' % Started 6/25/15  (permenant record wont show till 6/26/15) %%started center 7/14/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 43;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%        stim.slowSecs = 1;
%        
%     case 'pvchr9tt' % Started 7/14/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 16;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%     
%     case 'pvchr9rt' % Started 7/14/15
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 16;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%     
%     case 'pvchr9lt' % Started 7/14/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 16;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%     
%     case 'g62n7ln' % Started 7/14/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 11;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%        

   
%     case 'g62q1lt' % Started 7/14/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 11;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
       
%     case 'g62w2lt' % Started 7/14/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 11;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%     
%     case 'g62w2rt' % Started 7/2/15  RESTARTED 8/7/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 76;
%        msPenalty               =4200;
%        percentCorrectionTrials = .5;
%        
          
%     case 'g62a3tt' % Started 6/25/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 16;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
       
%     case 'g62a2nn' % Started 6/25/15 (permenant record wont show till 6/26/15)
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 16;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
       
%     case 'g62a5nn' % Started 6/25/15
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 100;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
       
%     case 'pv8lt' % Started 6/25/15  (permenant record wont show till 6/26/15)
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 16;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%        stim.slowSecs = 1;
       
%     case 'pv8nt' % Started 6/25/15  (permenant record wont show till 6/26/15)
%        requestRewardSizeULorMS = 00;
%        rewardSizeULorMS        = 16;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;
%        stim.slowSecs = 1;
%        

            
    otherwise
        warning('unrecognized mouse, using defaults')
end;     



noRequest = constantReinforcement(rewardSizeULorMS,requestRewardSizeULorMS,requestMode,msPenalty,fractionOpenTimeSoundIsOn,fractionPenaltySoundIsOn,scalar,msAirpuff);



maxWidth  = 1920;
maxHeight = 1080;

[w,h] = rat(maxWidth/maxHeight);
textureSize = 10*[w,h];
zoom = [maxWidth maxHeight]./textureSize;

svnRev = {}; %{'svn://132.239.158.177/projects/ratrix/trunk'};
svnCheckMode = 'session';

interTrialLuminance = .5;

stim.gain = 0.7 * ones(2,1);
stim.targetDistance = 455 * ones(1,2);
stim.timeoutSecs = 10;
stim.slow = [40; 80]; % 10 * ones(2,1);
%stim.slowSecs = 1;  set above for case by case
stim.positional = true;
stim.cue = true;
stim.soundClue = false;

pixPerCycs             = [300]; %*10^9;
targetOrientations     = [-1 1]*pi/4;
distractorOrientations = []; %-targetOrientations;
mean                   = .5;
radius                 = .085;
contrast               = 1;
thresh                 = .00005;
yPosPct                = .5;
stim.stim = orientedGabors(pixPerCycs,targetOrientations,distractorOrientations,mean,radius,contrast,thresh,yPosPct,maxWidth,maxHeight,zoom,interTrialLuminance);
%stim.stim = orientedGabors(pixPerCycs,targetOrientations,distractorOrientations,mean,radius,[-1 1]  ,thresh,yPosPct,maxWidth,maxHeight,zoom,interTrialLuminance,'none', 'normalizeDiagonal');


stim.stim='flip';
%stim.stim=nan;
stim.dms.targetLatency = .5;
stim.dms.cueLatency = 0;
stim.dms.cueDuration = inf;
stim.dms = [];

 ballSM = setReinfAssocSecs(trail(stim,maxWidth,maxHeight,zoom,interTrialLuminance),1);
 %change stim to stay on for 1 sec after
 
ballTM = ball(percentCorrectionTrials,sm,noRequest);
ts1 = trainingStep(ballTM, ballSM, repeatIndefinitely(), noTimeOff(), svnRev, svnCheckMode); %ball

p=protocol('mouse',{ts1});

stepNum=uint8(1);
subj=getSubjectFromID(r,subjIDs{1});
[subj r]=setProtocolAndStep(subj,p,true,false,true,stepNum,r,'call to setProtocolMouse','edf');
end