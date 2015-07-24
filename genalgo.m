%Initialize Data
Initialize
%Initialize Chromosomes
lengthn=2;
n=1;
N=10;
maxperc=8;
gparms=[];
chromosomes=chromgen(lengthn,N,maxperc,n);
%Decode Chromosomes
parameters=chromdecode(lengthn,N,maxperc,n,chromosomes);
%Calculate Fitness
for i=1:N
fitness(i) = costfunctionSIS(data,timespan,IC,parameters(:,i),pop);
end
%Generate Probability Distribution and Choose Parents
prob=(max(fitness)-fitness)/sum(max(fitness)-fitness);
y = randsample(N,2,true,prob);
while y(1)==y(2)
    y = randsample(N,2,true,prob); %prevents same parents
end
parent1=chromosomes(y(1)).run;
parent2=chromosomes(y(2)).run;
%Mates by randomly choosing splice points
splicepoint=randsample(length(parents1,1);


