close all
clc
format long

%%INITIAL CONDITIONS

thetaa1 = 500; % ��������� �����������
w = 2*pi*1/4/3600; %�������
t = 0:10:3600; %�����
q1rad = 20000; %%���������� �������� ����������
k = 1; %% ���������� ����������
sigma = 100; %% ���������� ���������
B = 200; %%����������� ����������� ��������� �����-�����������
b = sqrt(k*k+k*sigma);
A = (b-k)/(b+k); %% �������
c = 450; %%�����������
rho = 2000; %%���������
Kt = 0.1; %% ����������� ����������������
at = Kt/c/rho; %%����������� ����������������������
z = 0:0.0005:0.01;
deltaphi_rad_conv = 0;

%%

h = figure('rend','painters','pos',[100 100 650 700])
[z,t] = meshgrid(0:.01:1,0:.01:1);
t = t.*3600*4;
z = z.*0.1;%.*1e-12;
theta = rad_f_z(thetaa1,w,t,q1rad,k,sigma,B,c,rho,Kt,z,deltaphi_rad_conv);
c = gray(5)-0.2;
id = find(c<1);
c(id)=0;
colormap(c);
mesh(z,t,theta+1000)
zlim([0 inf])
xlabel('������� Z, �');
ylabel('�����, �');
zlabel('�����������, �');
xlabel('{\itz}, m');
ylabel('{\itt}, s');
zlabel('{\it\theta_{A}(t)}, C');
set(gca, 'Position', [0.23 0.2 0.65 0.65])
set(gca, 'FontName', 'Arial')
set(gca, 'FontSize', 25);
set(gcf,'color','w');
%63 46
set(gcf,'PaperPositionMode','auto')
view(235,32);
print('tres1_3d','-dpng');
