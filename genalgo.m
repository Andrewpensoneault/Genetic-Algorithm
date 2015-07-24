%%INITIAL LOOP
%Initialize Data
Initialize
%Initialize Chromosomes
Initializechrom
%Decode Chromosomes
parameters=chromdecode(lengthn,N,maxperc,n,chromosomes);
%Calculate Fitness
for i=1:N
    fitness(i) = costfunctionSIS(data,timespan,IC,parameters(:,i),pop);
end
fitnessmin=min(fitness);
lastimprove=fitnessmin;
%Generate Probability Distribution and Choose Parents
Parent=parentgen(fitness,chromosomes,N,survival);
%Mates by randomly choosing splice points
children=mate(n,maxperc,lengthn,Parent,mutrate,N,survival);
chromosomes=[children Parent];
%%
%%LOOP
%Repeat
while(fitnessmin>fitnessthreshold && noimprove<improvethresh)
    count=count+1
    if Reset==1
        chromosomes=[chromgen(lengthn,N-1,maxperc,n) nextera];
        Reset=0;
    end
    %Decode Chromosomes
    parameters=chromdecode(lengthn,N,maxperc,n,chromosomes);
    %Calculate Fitness
    Fitness
    %Generate Probability Distribution and Choose Parents
    Parent=parentgen(fitness,chromosomes,N,survival);
    %Mates by randomly choosing splice points
    children=mate(n,maxperc,lengthn,Parent,mutrate,N,survival); 
    chromosomes=[children Parent];
    %Extraction and Immigration
    if(under>thresholdruns)
        parameters=chromdecode(lengthn,N,maxperc,n,chromosomes);
        for i=1:N
            fitness(i) = costfunctionSIS(data,timespan,IC,parameters(:,i),pop);
        end
            [~,nexteranum] = min(fitness(i));
            nextera=chromosomes(:,nexteranum);
            under=0;
            Reset=1;
            era=era+1
    end
    %TO BE IMPLIMENTED
end
fprintf('The best results were values from beta of %1.8f and gamma of %1.8f \n', best(1),best(2))

