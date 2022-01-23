clear;

data = readmatrix('bsmdata.csv');

price = linspace(0,200,100)';
strike = linspace(50,150,30)';
time = linspace(0,5,20)';
rate = linspace(0.001,0.05,20)';
volatility = linspace(0.05,1.5,20)';

priceInc = price(2) - price(1);
strikeInc = strike(2) - strike(1);
timeInc = time(2) - time(1);
rateInc = rate(2) - rate(1);
volatilityInc = volatility(2) - volatility(1);

% price = generateRandom(price,0,200,priceInc);
% strike = generateRandom(strike,50,150,strikeInc);
% time = generateRandom(time,0,5,timeInc);
% rate = generateRandom(rate,0.001,0.05,rateInc);
% volatility = generateRandom(volatility,0.05,1.5,volatilityInc);

% price = linspace(0,200,2);
% strike = linspace(50,150,2);
% time = linspace(0,5,2);
% rate = linspace(.001,0.05,2);
% volatility = linspace(0.05,1.5,2);

a = combvec(price', strike', time', rate', volatility')';

a(:,1) = generateRandom(a(:,1),0,200,priceInc);
a(:,2) = generateRandom(a(:,2),50,150,strikeInc);
a(:,3) = generateRandom(a(:,3),0,5,timeInc);
a(:,4) = generateRandom(a(:,4),0.001,0.05,rateInc);
a(:,5) = generateRandom(a(:,5),0.05,1.5,volatilityInc);

[~,Put] = blsprice(a(:,1),a(:,2),a(:,4),a(:,3),a(:,5));

rng(1);

function dataGen = generateRandom(data,min,max,inc)
randNum = inc*rand(length(data),1);
dataGen = data + randNum - (inc/2);
dataGen(dataGen < min) = min;
dataGen(dataGen > max) = max;
end

