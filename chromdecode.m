function params = chromdecode(lengthn,N,maxperc,n,chromosomes)
for i=1:N
    for j=1:lengthn
        chromosome=chromosomes(i).run;
        p = chromosome(1+(j-1)*(n+maxperc):j*(n+maxperc));
        params(j,i) = p*pow2(n-1:-1:-maxperc).';
end
end