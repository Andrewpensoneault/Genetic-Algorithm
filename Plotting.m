[~,y]=ode45(@SISModel,1:1:length(data),IC,[],best',pop); 
plot(1:length(data),data,'r+',1:length(data),y,'b-')
