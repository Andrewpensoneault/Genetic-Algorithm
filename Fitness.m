for i=1:N
    fitness(i) = costfunctionSIS(data,timespan,IC,parameters(:,i),pop);   %finds fitness
end
%%
%%Tests for below threshold
[fitnessminnew,num]=min(fitness);       %finds most fit
if fitnessminnew<fitnessthreshold       %compairs to threshold
    break
end
%%
%%Tests if improvement
if lastimprove-fitnessminnew<=0         %if there is no improvement count+1
    noimprove=noimprove+1;
    
    %Tests if change
    if (abs(fitnessminnew-fitnessmin)==0)   %if no change
        under=under+1;                      %count+1
    else
        under=0;                            %resets change count
        fitnessmin=fitnessminnew;           %new fitnessmin
    end
else
    noimprove=0;                        %reset count
    lastimprove=fitnessminnew;          %new best
    best=chromdecode(lengthn,1,maxperc,n,chromosomes(:,num)); %save parameters
    bestchrom=chromosomes(:,num);       %save chromosome
    under=0;                            %resets change count
    fitnessmin=fitnessminnew;           %new fitnessmin
end


fitnessminnew