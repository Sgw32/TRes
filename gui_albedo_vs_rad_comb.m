%%albedo vs rad

%close all
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

kappa = k;

A(1,:)=(b(1,:)-k(1,1))./(b(1,:)+k(1,1));
A(2,:)=(b(2,:)-k(1,1))./(b(2,:)+k(1,1));

h = gcf;%figure('rend','painters','pos',[100 100 650 700]) 

plot(phi,A(1,:).*100,'k'); %1a
hold on
plot(phi,A(2,:).*100,'k--'); %1a
hold on

xlabel('{\it\phi}, rad');
ylabel('{\itAlbedo}, %');
set(gca, 'FontName', 'Arial')
set(gca, 'Position', [0.2 0.2 0.65 0.65])
set(gca, 'FontSize', 25);
set(gcf,'color','w');
%set(gca,'XTick',pi/6*31/30:pi/4:pi/2*89/90) 
%set(gca,'XTickLabel',{'\pi/6','\pi/4'}) 
xlim([pi/6*31/30 pi/2*89/90])
ylim([30 100])
set(gcf,'PaperPositionMode','auto')
print('results\tres1_comb','-dpng');

