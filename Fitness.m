for i=1:N
        fitness(i) = costfunctionSIS(data,timespan,IC,parameters(:,i),pop);
    end
    [fitnessminnew,num]=min(fitness);
    fitnessminnew
    if fitnessminnew<fitnessthreshold
        break
    end
    if lastimprove-fitnessminnew<0
        noimprove=noimprove+1;
    else
        noimprove=0;
        lastimprove=fitnessminnew;
        best=chromdecode(lengthn,1,maxperc,n,chromosomes(:,num));

    end
    if (abs(fitnessminnew-fitnessmin)<0)
        under=under+1;
        fitnessmin=fitnessminnew;
    else
        under=0;
        fitnessmin=fitnessminnew;
    end