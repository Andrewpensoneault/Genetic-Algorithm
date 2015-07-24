%%INITIAL LOOP
%Initialize Data - 0.178001 seconds 
Initialize
%Initialize Chromosomes - 0.018125 seconds
Initializechrom
%Decode Chromosomes - 0.014881 seconds
parameters=chromdecode(lengthn,N,maxperc,n,chromosomes);
%Calculate Fitness - O(N) (approx .02*N seconds)
for i=1:N
    fitness(i) = costfunctionSIS(data,timespan,IC,parameters(:,i),pop);
end
[fitnessmin,num]=min(fitness);
lastimprove=fitnessmin;
bestchrom=chromosomes(:,num); 
%Generate Probability Distribution and Choose Parents - 0.023633 seconds.
Parent=parentgen(fitness,chromosomes,N,survival,num);
%Mates by randomly choosing splice points - 0.929026 seconds.
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
    Parent=parentgen(fitness,chromosomes,N,survival,num);
    %Mates by randomly choosing splice points
    children=mate(n,maxperc,lengthn,Parent,mutrate,N,survival); 
    chromosomes=[children Parent];
    %Extraction and Immigration
    if(under>thresholdruns)
            nextera=bestchrom;
            under=0;
            Reset=1;
            era=era+1
    end
end
fprintf('The best results were values from beta of %1.8f and gamma of %1.8f \n', best(1),best(2))

