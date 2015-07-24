function val = costfunctionSIS(data,timespan,init_vec,theta,N)
% Theta = parameters

options = [];
[~,y]=ode45(@SISModel,1:1:length(data),init_vec,[],theta,N); 
% Cost Function
if length(y)<length(data)
    y(length(y):length(data))=0;
end
    val = sum((data-y).^2./y.^2);
end