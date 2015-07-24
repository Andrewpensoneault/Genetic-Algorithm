function ydot=SISModel(t,y,a,N)
ydot=[a(1)*y*(N-y)/N-a(2)*y];
end