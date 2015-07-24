function val = costfunctionSIS(data,timespan,init_vec,theta,N)
% Theta = parameters

options = [];
[~,y]=ode45(@SISModel,0:1:timespan,init_vec,[],theta,N); 

w = y;

% Cost Function model form
val = sum((data-w).^2);


function ydot=SISModel(t,y,a,N)
ydot=[a(1)*y*(N-y)/N-a(2)*y];
end
end