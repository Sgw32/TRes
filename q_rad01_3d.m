close all
clc
format long

%%INITIAL CONDITIONS

thetaa1 = 500; % начальная температура
w = 2*pi*1/4/3600; %частота
t = 0:10:3600; %время
q1rad = 20000; %%переменная лучистая компонента
k = 1; %% показатель поглощения
sigma = 100; %% показатель рассеяния
B = 200; %%коэффициент теплоотдачи воздушная среда-поверхность
b = sqrt(k*k+k*sigma);
A = (b-k)/(b+k); %% альбедо
c = 450; %%теплоёмкость
rho = 2000; %%плотность
Kt = 0.1; %% коэффициент теплопроводности
at = Kt/c/rho; %%коэффициент температуропроводности
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
xlabel('Глубина Z, м');
ylabel('Время, с');
zlabel('Температура, С');
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
