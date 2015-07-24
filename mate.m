function child = mate(n,maxperc,lengthn,Parent,mutrate,N,survival)
%Mates by randomly choosing splice points
[~,k1]=size(Parent);                 %Number of Parents
for j=1:round((N-survival)/2)         %Mating occurs (N-survival)/2 times rounded up
    list=1:k1;
    for l=1:2
        parentnum(l) = randsample(list,1);
        list=list(1:end~=parentnum(l));
    end
    splicepoint=randsample(lengthn-1,1);
    child(:,2*j-1)=[Parent(1:splicepoint*(maxperc+n),parentnum(1));Parent(splicepoint*(maxperc+n)+1:end,parentnum(1))];
    child(:,2*j)=[Parent(1:splicepoint*(maxperc+n),parentnum(2));Parent(splicepoint*(maxperc+n)+1:end,parentnum(1))];
end
[s1,k2]=size(child);
if k2>N-survival
    child=child(:,randsample(k2,N-survival));
end
    %Check if mutation
    for m=1:s1
        for o=1:N-survival
            mut(o)=randsample(2,1,true,[mutrate,1-mutrate]);
            if (mut(o)==1)
                child(m,o)=mod(child(m,o)+1,2);
            end
        end
    end
end