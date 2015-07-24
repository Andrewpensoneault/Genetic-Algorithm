function parents = parentgen(fitness,chromosomes,N,survival,elite)
%Generate Probability Distribution and Choose Parents
parentnum(1)=elite;
list=(1:N);
list=list(1:end ~=elite);
for i=2:survival
    prob=(max(fitness(list))-fitness(list))/sum(max(fitness(list))-fitness(list)); %probabilities from list
    if any(isnan(prob(:)))==1
        prob=ones(length(list),1)/length(list);
    end
    parentnum(i) = randsample(list,1,true,prob); %1 Parent chosen
    list=list(1:end~=parentnum(i)); %remove them from list
end
parents=chromosomes(:,parentnum); %concatinate the parents chromosomees