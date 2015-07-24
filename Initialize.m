%Data generation
clc
clear all
ranseed=2;
rand('seed',ranseed)
params=[.125,.1];
timespan=365;
pop=1000;
IC=5;
%% Deterministic
%r=sqrt(1);
%data=datagenSIS(params,pop,IC,timespan,r);
%% Stochastic
nsamp=1;
data=stochasticSIS_gen_data(nsamp,timespan,[pop-IC,IC],params);
data=data(find(data(:,2)~=0),2);