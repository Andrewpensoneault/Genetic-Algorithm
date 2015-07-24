function parents = parentgen(fitness,chromosomes,N,survival)
%Generate Probability Distribution and Choose Parents
list=1:N;
for i=1:survival
    prob=(max(fitness(list))-fitness(list))/sum(max(fitness(list))-fitness(list)); %probabilities from list
    if any(isnan(prob(:)))==1
        prob=ones(length(list),1)/length(list);
    end
    parentnum(i) = randsample(list,1,true,prob); %1 Parent chosen
    list=list(1:end~=parentnum(i)); %remove them from list
end
parents=chromosomes(:,parentnum); %concatinate the parents chromosomees