%%albedo vs rad

close all
phi = 0:pi/72*pi/72:pi/2*pi/2;
phi = sqrt(phi);

t(1)=3600;
t(2)=3600/2;
t(3)=3600/4;
b=zeros(4,length(phi));

b(1,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(1)));
b(2,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at/10*t(1)));

A=zeros(16,length(phi)); %альбедо, коэффициент отражения полубесконечного слоя вещества
k=zeros(2,1);
k(1,1)=1;

kappa = 1;

A(1,:)=(b(1,:)-kappa)./(b(1,:)+kappa);
A(2,:)=(b(2,:)-kappa)./(b(2,:)+kappa);

h = figure('rend','painters','pos',[100 100 650 700]) 

plot(phi,b(1,:),'k'); %1a
hold on
plot(phi,b(2,:),'k--'); %1a
hold on

xlabel('{\it\phi}, rad');
%ylabel('{\itAlbedo}, %');
set(gca, 'FontName', 'Arial')
set(gca, 'Position', [0.2 0.2 0.65 0.65])
set(gca, 'FontSize', 25);
set(gcf,'color','w');
set(gca,'XTick',0:pi/4:pi/2) 
set(gca,'XTickLabel',{'0','\pi/4','\pi/2'}) 
xlim([0.2 pi/2])
%ylim([30 100])
set(gcf,'PaperPositionMode','auto')
print('results\b','-dpng');
