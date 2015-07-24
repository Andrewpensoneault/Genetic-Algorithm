function children = mate(n,maxperc,lengthn,parent1,parent2,mutrate)
%Mates by randomly choosing splice points
splicepoint=randsample(lengthn-1,1);
child1=[parent1(1:splicepoint*(maxperc+n)) parent2(splicepoint*(maxperc+n)+1:end)];
child2=[parent2(1:splicepoint*(maxperc+n)) parent1(splicepoint*(maxperc+n)+1:end)];
%Check if mutation
for i=1:length(child2)
    mut1(i)=randsample(2,1,true,[mutrate,1-mutrate]);
    mut2(i)=randsample(2,1,true,[mutrate,1-mutrate]);
    if (mut1(i)==1)
    child1(i)=mod(child1(i)+1,2)
    end
    if (mut2(i)==1)
    child2(i)=mod(child2(i)+1,2)
    end
end
children(1).run=child1;
children(2).run=child2;
end