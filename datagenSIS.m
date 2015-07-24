function data = datagenSIS(params,pop,IC,tstop,r)
% Numerical Solutions
parameters=[params pop];
options = [];
[~,y]=ode45(@sis_ode_6_19,0:1:tstop,IC,options,parameters);
% Generate noisy data in I
data = y(:,1) + r.*randn(size(y(:,1),1),1);
end
