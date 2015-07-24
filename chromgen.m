function chromosomes=chromgen(lengthn,N,maxperc,n)
%Generates N of Chromosomes for initial parameters q
chromosome=[];
q=rand(lengthn,N);
for i=1:N
    for j=1:lengthn
        a=q(j,i);   
        m = maxperc;                % number bits for fraction part of your number
% binary number
        param = fix(rem(a*pow2(-(n-1):m),2));
        chromosome=[chromosome param];
    end
    chromosomes(i).run=chromosome;
    chromosome=[];
end
