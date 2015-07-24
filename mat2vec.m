function vec=mat2vec(mat)
[n,m]=size(mat);
vec=zeros(n*m,1);
for i=1:n*m
    vec(i)=mat(i);
end