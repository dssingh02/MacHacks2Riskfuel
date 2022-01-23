clear;

load Mdl1.mat
load Mdl2.mat
load Mdl3.mat
load Mdl4.mat
load Mdl5.mat

x = readmatrix('bsmtrainingdata.csv');
y = readmatrix('bsmtargetdata.csv');

data = readmatrix('bsmdata2.csv');
x = data(:,1:5);
y = data(:,6);

idx = randperm(length(x));

trainingFrac = 0.8;

trainNum = trainingFrac * length(x);
testNum = length(x) - trainNum;

xTrain = x(idx(1:trainNum),:);
yTrain = y(idx(1:trainNum));

xTest = x(idx(trainNum + 1:end),:);
yTest = y(idx(trainNum + 1:end));

rng(69) % For reproducibility of the partition
% Mdl1 = fitrnet(xTrain,yTrain,"Standardize",true,...
%     "LayerSizes",[30 10], "Verbose",1, ShowPlots, true);

% yPreds = Mdl5.predict(xTest);
% MSE = sqrt(mean((yPreds - yTest).^2));
% maxSSR = sqrt(max((yPreds - yTest).^2));

% Mdl2 = fitrnet(xTrain,yTrain,"Standardize",true,...
%     "LayerSizes",[32 64 64 32 10], "Verbose",1);

% x(:,1) = x(:,1)/200;
% x(:,2) = (x(:,2)-50)/100;
% x(:,3) = x(:,3)/5;
% x(:,4) = (x(:,4)-0.001)/(0.05-0.001);
% x(:,5) = (x(:,5)-1.5)/(1.5-0.05);
% 
% xTrain = x(idx(1:trainNum),:);
% yTrain = y(idx(1:trainNum));
% 
% xTest = x(idx(trainNum + 1:end),:);
% yTest = y(idx(trainNum + 1:end));

% Mdl3 = fitrnet(xTrain,yTrain,"Standardize",true,...
%     "LayerSizes",[30 10 10], "Verbose",1, "IterationLimit", 250);

% Mdl4 = fitrnet(xTrain,yTrain,"Standardize",true,...
%     "LayerSizes",[30 20], "Verbose",1, "IterationLimit", 250);

% Mdl5 = fitrnet(xTrain,yTrain,"Standardize",true,...
%     "LayerSizes",[64 32 8], "Verbose",1, "IterationLimit", 1000);

Mdl6 = fitrnet(xTrain,yTrain,"Standardize",true,...
    "LayerSizes",[64 32 8], "Verbose",1, "IterationLimit", 1000);


