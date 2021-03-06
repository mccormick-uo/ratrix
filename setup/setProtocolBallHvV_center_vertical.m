function r = setProtocolHvV_center_vertical(r,subjIDs)

if ~isa(r,'ratrix')
    error('need a ratrix')
end

if ~all(ismember(subjIDs,getSubjectIDs(r)))
    error('not all those subject IDs are in that ratrix')
end

sm=makeStandardSoundManager();

rewardSizeULorMS          =80;
requestRewardSizeULorMS   =0;
requestMode               ='first';
msPenalty                 =3500;     %consider changing this also in future
fractionOpenTimeSoundIsOn =1;
fractionPenaltySoundIsOn  =1;
scalar                    =1;
msAirpuff                 =0;
radius                 = .25;
pixPerCycs                = [200];
percentCorrectionTrials = .5;
stim.gain = 0.7 * ones(2,1);

% sca
% keyboard

if ~isscalar(subjIDs)
    error('expecting exactly one subject')
end
switch subjIDs{1}
    
    case 'hvvtest' 
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;
       percentCorrectionTrials = .75;        
        
    
   case 'testHvVcenter' % 
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 420;
       msPenalty               =6300;
       
   case 'j365rt'  %started hvv center squared with eye patch 10/6/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         radius                  = .25;
         percentCorrectionTrials = .5; 
       
   case 'j365lt'  %started 9/13/17 %%start hvv center squared 10/2/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         radius                  = .25;
         percentCorrectionTrials = .5; 
    
   case 'j366rt'  %started 9/13/17 %%start hvv center squared with eye patch 10/2/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         radius                  = .25;
         percentCorrectionTrials = .5;   
         
   case 'j366tt'  %started 9/13/17 %%start hvv center lateral 10/2/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         radius                  = .25;
         percentCorrectionTrials = .5;        
    
    case 'j364tt'  %started 9/13/17 %%start hvv center lateral 9/25/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         radius                  = .25;
         percentCorrectionTrials = .5;        

    case 'j366lt'  %started 9/13/17 %%start hvv center squared 9/28/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         radius                  = .25;
         percentCorrectionTrials = .5; 
         
           case 'j364nt'  %started 9/13/17 %%start hvv center lateral 9/27/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         radius                  = .25;
         percentCorrectionTrials = .5;  
         
          case 'j364rt'  %started 9/13/17 %%start hvv center squared eye patch 9/27/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         radius                  = .25;
         percentCorrectionTrials = .5;         
       
          case 'j364lt'  %started 9/13/17 %%start hvv center squared 9/27/17
         requestRewardSizeULorMS = 0;
         rewardSizeULorMS        = 219;
         msPenalty               =3500;
         radius                  = .25;
         percentCorrectionTrials = .5;        

%          case 'j351tt'  %started 7/26/17 %%start center 8/17/17
%          requestRewardSizeULorMS = 0;
%          rewardSizeULorMS        = 219;
%          msPenalty               =3500;
%          percentCorrectionTrials = .5;  
%          
%          case 'j351rt'  %started 7/26/17 %%start center 8/17/17
%          requestRewardSizeULorMS = 0;
%          rewardSizeULorMS        = 219;
%          msPenalty               =3500;
%          percentCorrectionTrials = .5;   
%          
%          case 'j351lt'  %started 7/26/17 %%start center 8/17/17
%          requestRewardSizeULorMS = 0;
%          rewardSizeULorMS        = 219;
%          msPenalty               =3500;
%          percentCorrectionTrials = .5;      
%         
%          case 'j352tt'  %started 7/26/17 %%start center 8/17/17
%          requestRewardSizeULorMS = 0;
%          rewardSizeULorMS        = 219;
%          msPenalty               =3500;
%          percentCorrectionTrials = .5;      
%         
%          case 'j352rt'  %started 7/26/17 %%start center 8/17/17
%          requestRewardSizeULorMS = 0;
%          rewardSizeULorMS        = 219;
%          msPenalty               =3500;
%          percentCorrectionTrials = .5;      
%     
%          case 'j352lt'  %started 7/26/17 %%start center 8/17/17
%          requestRewardSizeULorMS = 0;
%          rewardSizeULorMS        = 219;
%          msPenalty               =3500;
%          percentCorrectionTrials = .5;         
%        
%    case 'g62aaa11rt'  %started 4/25/17 %%hvv center 5/10/17
%          requestRewardSizeULorMS = 0;
%          rewardSizeULorMS        = 219;
%          msPenalty               =3500;
%          percentCorrectionTrials = .5;         
%          radius                 = .25;
%          
% %     case 'g62zz9tt'  %started 5/4/17 %%start hvv 5/16/17
% %          requestRewardSizeULorMS = 0;
% %          rewardSizeULorMS        = 219;
% %          msPenalty               =3500;
% %          percentCorrectionTrials = .5;          
%        
%    case 'g62pp9lt' % Started 4/07/17  %%start hvv 4/18/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;   
%        radius                 = .25;   
    
%    case 'g62aaa11lt'  %started 4/25/17 %%start center 5/4/17
%          requestRewardSizeULorMS = 0;
%          rewardSizeULorMS        = 219;
%          msPenalty               =3500;
%          percentCorrectionTrials = .5;  

   case 'g62ddd2tt' % Started 4/07/17  %%start hvv 4/18/17
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 219;
       msPenalty               =3500;   
       percentCorrectionTrials = .5;  
       
%    case 'g62aaa10lt' % Started 4/07/17 %%start hvv 4/15/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;    
    
%    case 'g62aaa10tt' % Started 4/07/17 %%start hvv center 4/15/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5; 
       
%    case 'g62ss4lt' % Started 4/07/17  %%hvv center 4/15/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;      
          
    
%    case 'g62ddd3ln' % Started 4/05/17  %%hvv center 4/15/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;          
       
%    case 'g62ddd3tt' % Started 4/05/17 %%hvv start 4/14/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;         
       
%     case 'g62ww3rt' % Started 4/05/17 %%hvv start 4/13/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;       
% 
%     case 'g62aaa4tt' % Started 3/29/17 %%hvv start 4/8/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;    
% 
%    case 'g62ggg6tt' % Started 3/29/17 %%hvv start 4/8/17
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 219;
%        msPenalty               =3500;
%        percentCorrectionTrials = .5;  
       
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
stim.soundClue = true;

targetOrientations     = 0
distractorOrientations = []; %-targetOrientations;
mean                   = .5;
contrast               = 1;
thresh                 = .00005;
normalizedPosition      = [.5];
scaleFactor            = 0; %[1 1];
axis                   = pi/2;



%%% abstract orientation (e.g. 0 = go left, pi/2 = go right)
targetOrientations = pi/2;
distractorOrientations = 0;

%for creating psychometric curves (contrast and orientation)
% switch subjIDs{1}
%         
%      case 'g62c.2rt'           %set variable parameters
%             contrast               = [.01, .05, .1, .25, .5, 1];
% percentCorrectionTrials = .1;
%         
%      case 'g62b7lt'            %set variable parameters
%    targetOrientations = [(-pi/4)+(pi/2),(-pi/8)+(pi/2),(-3*pi/16)+(pi/2), (-pi/16)+(pi/2), 0+(pi/2)];
%    distractorOrientations = [0, (pi/16), (pi/8), (3*pi/16), (pi/4)];
%    percentCorrectionTrials = .1;
%     otherwise
%         warning('unrecognized mouse, using defaults')
% end



stim.stim = orientedGabors(pixPerCycs,{distractorOrientations [] targetOrientations},'abstract',mean,radius,contrast,thresh,normalizedPosition,maxWidth,maxHeight,scaleFactor,interTrialLuminance,[],[],axis);

 ballTM = ball(percentCorrectionTrials,sm,noRequest);
 
 ballSM = setReinfAssocSecs(trail(stim,maxWidth,maxHeight,zoom,interTrialLuminance),1);
 %change stim to stay on for 1 sec after
 
 ts1 = trainingStep(ballTM, ballSM, repeatIndefinitely(), noTimeOff(), svnRev, svnCheckMode); %ball
 
 p=protocol('mouse',{ts1});
%p=protocol('mouse',{ts1,ts2});

stepNum=uint8(1);
subj=getSubjectFromID(r,subjIDs{1});
[subj r]=setProtocolAndStep(subj,p,true,false,true,stepNum,r,'LY01 (40,80), R=36','edf');
end