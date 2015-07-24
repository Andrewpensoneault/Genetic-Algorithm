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
%Generate Probability Distribution and Choose Parents
parent=parentgen(fitness,chromosomes,N);
parent1=parent(1).run;
parent2=parent(2).run;
%Mates by randomly choosing splice points
children=mate(n,maxperc,lengthn,parent1,parent2,mutrate);
child1=children(1).run;
child2=children(2).run;
%Extraction and Immigration
%TO BE IMPLIMENTED
%%
%%LOOP
%Fill out children
while(under<thresholdruns)
    count=count+1
    chromosomes=chromgen(lengthn,N-2,maxperc,n);
    chromosomes(N-1).run = child1;
    chromosomes(N).run = child2;
    %Decode Chromosomes
    parameters=chromdecode(lengthn,N,maxperc,n,chromosomes);
    %Calculate Fitness
    for i=1:N
        fitness(i) = costfunctionSIS(data,timespan,IC,parameters(:,i),pop);
    end
    fitnessminnew=min(fitness);
    if (abs(fitnessminnew-fitnessmin)<fitnessthreshold)
        under=under+1;
        fitnessmin=fitnessminnew;
    else
        under=0;
        fitnessmin=fitnessminnew;
    end
    %Generate Probability Distribution and Choose Parents
    parent=parentgen(fitness,chromosomes,N);
    parent1=parent(1).run;
    parent2=parent(2).run;
    %Mates by randomly choosing splice points
    children=mate(n,maxperc,lengthn,parent1,parent2,mutrate);
    child1=children(1).run;
    child2=children(2).run;
    %Extraction and Immigration
    %TO BE IMPLIMENTED
end
parameters=chromdecode(lengthn,1,maxperc,n,parent1);
fprintf('The best results were values from beta of %1.8f and gamma of %1.8f \n', parameters(1),parameters(2))

