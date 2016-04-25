%%% based on session data and generic points, does pointwise analysis
%%% for topo (periodic spatial) stimuli
clear all

[f p] = uigetfile('*.mat','session data');
load(fullfile(p,f),'polarImg')

dt = 0.25;
cycLength = 10 / dt;

    ptsfname = uigetfile('*.mat','pts file');
    load(ptsfname);
if ~exist('polarImg','var')
    [f p] = uigetfile('*.mat','session data');
load(fullfile(p,f),'polarImg')
end

usenonzero = find(mean(dF,2)~=0); %%% gets rid of generic points that were not identified in this session

usenonzero=1:400;
figure
imagesc(dF(usenonzero,:),[0 1]); ylabel('cell #'); xlabel('frame')


%%% get Fourier component and cycle averages
phaseVal = 0;
for i= 1:size(dF,2);
    phaseVal = phaseVal+dF(:,i)*exp(2*pi*sqrt(-1)*i/cycLength);
end
phaseVal = phaseVal/size(dF,2);

clear cycAvg
for i = 1:cycLength;
    cycAvg(:,i) = mean(dF(:,i:cycLength:end),2);
end
for i = 1:size(cycAvg,1);
    cycAvg(i,:) = cycAvg(i,:) - min(cycAvg(i,:));
end
save(ptsfname,'phaseVal','cycAvg','polarImg','-append');

figure
plot(cycAvg')

ph = angle(phaseVal);
ph = mod(ph,2*pi);

figure
hist(ph(usenonzero)); xlabel('phase')

figure
hist(abs(phaseVal(usenonzero)),0.0125:0.025:1); xlabel('amplitude');

figure
imshow(polarImg);

figure
draw2pSegs(usePts,ph,hsv,size(meanShiftImg,1),intersect(usenonzero,find(abs(phaseVal)>0.0)),[pi/2  (2*pi -pi/4)]);

for i = 1:size(dF,2);
    dFnorm(:,i) = dF(:,i)/max(dF(:,i));
end

col = 'rgb';
[coeff score latent] = pca(dFnorm');
figure
plot(score(:,1),score(:,2))
figure
hold on
for i = 1:5
    subplot(5,1,i)
    plot(score(:,i))
end

figure
plot(latent(1:10)/sum(latent))

cycGood = downsamplebin(cycAvg(usenonzero,:),2,2)/2;
dist = pdist(cycGood,'correlation');
Z = linkage(dist,'ward');
leafOrder = optimalleaforder(Z,dist);
figure
subplot(3,4,[1 5 9 ])
[h t perm] = dendrogram(Z,0,'Orientation','Left','ColorThreshold' ,5,'reorder',leafOrder);
axis off
subplot(3,4,[2 3 4 6 7 8 10 11 12 ]);
imagesc(flipud(cycGood(perm,:)),[0 1]); 
drawnow

[Y e] = mdscale(dist,1);
[y sortind] = sort(Y);
figure
imagesc(cycGood(sortind,:),[0 1])
title('mdscale')
