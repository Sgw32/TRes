%%albedo vs rad

close all


phi = 0:pi/72*pi/72:pi/2*pi/2;

c = 450; %%теплоёмкость
rho = 4000; %%плотность
Kt = 1; %% коэффициент теплопроводности
at = Kt/c/rho; %%коэффициент температуропроводности

phi = sqrt(phi);
t(1)=3600;
t(2)=3600/2;
t(3)=3600/4;
b=zeros(3,length(phi));
b(1,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(1)));
b(2,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(2))); %% 3.32 показатель ослабления излучения светорассеивающей среды в условиях многократного рассения.
b(3,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(3))); %% 3.32 показатель ослабления излучения светорассеивающей среды в условиях многократного рассения.

A=zeros(16,length(phi)); %альбедо, коэффициент отражения полубесконечного слоя вещества
k=zeros(2,1);
k(1,1)=1;
k(2,1)=2;

A(1,:)=(b(1,:)-k(1,1))./(b(1,:)+k(1,1));
A(2,:)=(b(1,:)-k(2,1))./(b(1,:)+k(2,1));

A(3,:)=(b(2,:)-k(1,1))./(b(2,:)+k(1,1));
A(4,:)=(b(2,:)-k(2,1))./(b(2,:)+k(2,1));

A(5,:)=(b(3,:)-k(1,1))./(b(3,:)+k(1,1));
A(6,:)=(b(3,:)-k(2,1))./(b(3,:)+k(2,1));

h = figure('rend','painters','pos',[100 100 650 700]) 

plot(phi,A(1,:).*100,'k'); 
hold on
plot(phi,A(2,:).*100,'k--'); 
hold on
plot(phi,A(3,:).*100,'k'); 
hold on
plot(phi,A(4,:).*100,'k--'); 
hold on
%plot(phi,A(5,:).*100,'k--'); 
hold on
%plot(phi,A(6,:).*100,'k--'); 
hold on

xlabel('{\it\phi}, rad');
ylabel('{\itAlbedo}, %');
set(gca, 'FontName', 'Arial')
set(gca, 'Position', [0.2 0.2 0.65 0.65])
set(gca, 'FontSize', 25);
set(gcf,'color','w');
set(gca,'XTick',0:pi/4:pi/2) 
set(gca,'XTickLabel',{'0','\pi/4','\pi/2'}) 
xlim([0 pi/2])
ylim([70 100])
set(gcf,'PaperPositionMode','auto')
print('results\tres1_ceramics','-dpng');


