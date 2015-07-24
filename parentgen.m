function parents = parentgen(fitness,chromosomes,N)
%Generate Probability Distribution and Choose Parents
prob=(max(fitness)-fitness)/sum(max(fitness)-fitness);
parent = randsample(N,2,true,prob);
while parent(1)==parent(2)
    parent = randsample(N,2,true,prob); %prevents same parents
end
parents(1).run=chromosomes(parent(1)).run;
parents(2).run=chromosomes(parent(2)).run;