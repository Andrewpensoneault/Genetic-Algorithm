function dy=sis_ode_6_19(t,y,q)

%y(3) through y(6) are P matrix

beta=q(1);
gamma = q(2);
N=q(3);
I = y(1);
%P=[y(3) y(4); y(5) y(6)];

dy = zeros(1,1);
dy(1) = beta/N*(N-I)*I - gamma*I;
end