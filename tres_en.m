close all

lambda_t = 0.55; %% ����������� ���������������� ��������

phi = 0:pi/72:pi/2; %% ����� ���� ����� ������������ ������� � �������� ������� ���������
at = 1e-6; %%����������� ���������������������� (��)
at2 = 5.7*1e-7; %%����������� ���������������������� (����)
cp = 1000 %%�����������
t(1)=3600*12;
t(2)=3600*24;
t(3)=3600*2400;

b=zeros(10,length(phi));

b(1,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(1))); %% 3.32 ���������� ���������� ��������� ����������������� ����� � �������� ������������� ��������.
b(2,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(2))); %% 3.32 ���������� ���������� ��������� ����������������� ����� � �������� ������������� ��������.
b(3,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at*t(3))); %% 3.32 ���������� ���������� ��������� ����������������� ����� � �������� ������������� ��������.
b(4,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at2*t(1))); %% 3.32 ���������� ���������� ��������� ����������������� ����� � �������� ������������� ��������.
b(5,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at2*t(2))); %% 3.32 ���������� ���������� ��������� ����������������� ����� � �������� ������������� ��������.
b(6,:)=sqrt(2*pi./(tan(phi)+1e-10)./(at2*t(3))); %% 3.32 ���������� ���������� ��������� ����������������� ����� � �������� ������������� ��������.

figure 
plot(phi,b(1,:)); 
hold on
plot(phi,b(2,:)); 
hold on
plot(phi,b(3,:)); 
hold on
plot(phi,b(4,:),'--'); 
hold on
plot(phi,b(5,:),'--'); 
hold on
plot(phi,b(6,:),'--'); 
%title('����������� ���������� ���������� �� ����');
xlabel('{\it\phi}, rad');
ylabel('{\itAttenuation index}');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');
set(gca,'XTick',0:pi/4:pi/2) 
set(gca,'XTickLabel',{'0','\pi/4','\pi/2'})
ylim([0 b(1,2)*1.2]);
c1 = 1000;
c2 = 1000;

w = 2*pi*1/24/3600;
A=zeros(12,length(phi)); %�������, ����������� ��������� ���������������� ���� ��������
xi=zeros(12,length(phi));
sigma = 10; %2.77 xi^2+2*xi*sigma-b^2=0

%% "˸�"

xi(1,:)=1;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(1,:).^2))/2; 
A(1,:)=(b(1,:)-xi(1,:))./(b(1,:)+xi(1,:)); %%2.68

xi(2,:)=1;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(2,:).^2))/2; 
A(2,:)=(b(2,:)-xi(2,:))./(b(2,:)+xi(2,:)); %%2.68

xi(3,:)=1;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(3,:).^2))/2; 
A(3,:)=(b(3,:)-xi(3,:))./(b(3,:)+xi(3,:)); %%2.68

xi(4,:)=10;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(1,:).^2))/2; 
A(4,:)=(b(4,:)-xi(4,:))./(b(1,:)+xi(4,:)); %%2.68

xi(5,:)=10;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(2,:).^2))/2; 
A(5,:)=(b(5,:)-xi(5,:))./(b(2,:)+xi(5,:)); %%2.68

xi(6,:)=10;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(3,:).^2))/2; 
A(6,:)=(b(6,:)-xi(6,:))./(b(3,:)+xi(6,:)); %%2.68

%% "����"

xi(7,:)=1;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(1,:).^2))/2; 
A(7,:)=(b(4,:)-xi(7,:))./(b(4,:)+xi(7,:)); %%2.68

xi(8,:)=1;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(2,:).^2))/2; 
A(8,:)=(b(5,:)-xi(8,:))./(b(5,:)+xi(8,:)); %%2.68

xi(9,:)=1;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(3,:).^2))/2; 
A(9,:)=(b(6,:)-xi(9,:))./(b(6,:)+xi(9,:)); %%2.68

xi(10,:)=10;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(1,:).^2))/2; 
A(10,:)=(b(4,:)-xi(10,:))./(b(4,:)+xi(10,:)); %%2.68

xi(11,:)=10;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(2,:).^2))/2; 
A(11,:)=(b(5,:)-xi(11,:))./(b(5,:)+xi(11,:)); %%2.68

xi(12,:)=10;%%(-2.*sigma+sqrt(4.*sigma.*sigma+4*b(3,:).^2))/2; 
A(12,:)=(b(6,:)-xi(12,:))./(b(6,:)+xi(12,:)); %%2.68

A(:,1)=A(:,1)./A(:,1);

figure 
%% "˸�"

plot(phi,A(1,:).*100); 
hold on
plot(phi,A(2,:).*100); 
hold on
plot(phi,A(3,:).*100); 
hold on
plot(phi,A(4,:).*100); 
hold on
plot(phi,A(5,:).*100); 
hold on
plot(phi,A(6,:).*100); 
hold on

%% "����"
plot(phi,A(7,:).*100,'--'); 
hold on
plot(phi,A(8,:).*100,'--'); 
hold on
plot(phi,A(9,:).*100,'--'); 
hold on
plot(phi,A(10,:).*100,'--'); 
hold on
plot(phi,A(11,:).*100,'--'); 
hold on
plot(phi,A(12,:).*100,'--'); 
hold on
%%title('����������� ������� �� ����');
xlabel('{\it\phi}, rad');
ylabel('{\itAlbedo}, %');
set(gca, 'FontName', 'Arial')
set(gcf,'color','w');
set(gca,'XTick',0:pi/4:pi/2) 
set(gca,'XTickLabel',{'0','\pi/4','\pi/2'}) 
ylim([0 100])

% ������������� �������

figure
T0 = 293
phi = pi/16;
w = 1000;
b = 5; %���������� ���������� ��������� ����������������� �����
q = 1367 %% ��������� ������ ������� (���������� ���������)
xi=(-2*sigma+sqrt(4*sigma*sigma+4*b.^2))/2;
A=(b-xi)./(b+xi);

A=0.99;
t=0:100:t(1);

q1 = 500;
l2 = sin(phi);
l1 = cos(phi);
d1 = -(l1*at*b*b+l2*w)/(w*w+at*at*b^4);
d2 = (w*l1-at*b*b*l2)/(w*w+at*at*b^4);
B = 20; %%����������� ����������� ��������� �����-�����������
F1 = B*T0-(lambda_t*b+B)*q1*b*(1-A)*d1/cp;
F2 = q1*b*(1-A)*(lambda_t*b+B)*d2/cp;
delta = (lambda_t*sqrt(w/(2*at))+B)^2+lambda_t^2*w/(2*at);

c1 = ((lambda_t*sqrt(w./(2*at))+B)*F1+lambda_t*sqrt(w/(2*at))*F2)./delta; %%3.25
c2 = ((lambda_t*sqrt(w./(2*at))*F1-lambda_t*sqrt(w./(2*at))+B)*F2)./delta; %%3.25

psi = pi/20;%%asin(c2/(c1*c1+c2*c2));

theta = sqrt(c1*c1+c2*c2)*cos(w.*t-psi)-(1-A)./(sqrt(w.*w+at.*at.*b.*b.*b.*b)).*q1./cp*cos(w.*t-phi);
plot(t,theta)