function val = costfunctionSIS(data,timespan,init_vec,theta,N)
% Theta = parameters

options = [];
[~,y]=ode45(@SISModel,0:1:timespan,init_vec,[],theta,N); 

% Cost Function model form
if length(y)<length(data)
    y(length(y):length(data))=0;
end
    val = sum((data-y).^2./y.^2);


function ydot=SISModel(t,y,a,N)
ydot=[a(1)*y*(N-y)/N-a(2)*y];
end
end