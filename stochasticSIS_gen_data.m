%% Stochastic SIS Model - Module
function [binI] = stochasticSIS_gen_data(nsamp,tspan,init_vec,theta)

for n=1:nsamp
S=init_vec(1);
I=init_vec(2);
N=S+I;
clear storet storeI storeS
storeI=[];
storeS=[];
t=0;
i=1;

while(t<tspan)
    storeI(i)=I;
    storeS(i)=S;
    storet(i)=t;
    
    rates = [theta(1)/N*S*I theta(2)*I]; % Transition Rates
    R = sum(rates);
    mean_R = 1/R;
    tau = exprnd(mean_R);
    r2=rand(1);
    
       if(r2<rates(1)/R)
         S = S-1;   
         I = I+1;
       else
         S = S+1;
         I = I-1;
       end 
    t=t+tau;
    i=i+1;
end 

    run(n).storet = storet;
    run(n).storeS = storeS;
    run(n).storeI = storeI;
end

%% Binning
% This is the primary result - data set
j=1;
binI = binning(j,tspan,run); % Bins the first run data; i.e. nsamp doesn't matter. 
