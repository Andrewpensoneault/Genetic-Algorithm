function [ binI ] = binning(j,tspan,run)
%binning - bins the data into intervals 1,2,3,...
%   Detailed explanation goes here
meanI=zeros(1,tspan);
for day=1:tspan
    clear Ivect;
    Ivect=[];
    index_j = find(day-1 <= run(j).storet & run(j).storet < day);
    if ~isempty(index_j)
        Ivect = [Ivect run(j).storeI(index_j)];
    end
    if isempty(Ivect)
        meanI(day)=meanI(day-1);
    else
        meanI(day)=mean(Ivect);
    end
end 
binI = [[1:tspan]' meanI'];
end

