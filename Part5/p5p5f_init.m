%Task 5.5 f
% Declaring variabes
omega_0 = 0.7823;
lambda = 0.09;
K = 0.1561;
T = 72.4347;
sigma = sqrt(7.919*10^-4);
K_w = 2*lambda*omega_0*sigma;
I = eye(5); %identity matrix
T_s=0.1;
% Declaring matrix A, B, C amd E from 5.4 a)
A = [0 1 0 0 0;
    -omega_0^2 -2*lambda*omega_0 0 0 0;
    0 0 0 1 0;
    0 0 0 -1/T -K/T;
    0 0 0 0 0];
C = [0 1 1 0 0];
B= [0;
    0;
    0;
    K/T;
    0];
E= [0 0;
    K_w 0;
    0 0;
    0 0;
    0 1];
%Discretize continous model using exact discretization
%Sample frequency of 10Hz-> sample time of 0.1s
%Using matlab function c2d
[A_d, B_d]=c2d(A,B,T_s);
[A_d, E_d]=c2d(A,E,T_s);
C_d=C;

Q=[30 0;
    0 10^-6];
P_0=[1 0 0 0 0;
    0 0.013 0 0 0;
    0 0 pi^2 0 0;
    0 0 0 1 0;
    0 0 0 0 2.5*10^-3];
x_0=[0;0;0;0;0];
R_rad_d=R_rad/T_s; %0.0016(262)

my_colors=[[0,0.4470,0.7410];
    0.8500,0.3250,0.0980;
    0.9290,0.6940,0.1250;
    0.4940,0.1840,0.5560;
    0.4660,0.6740,0.1880;
    0.3010,0.7450,0.9330;
    0.6350,0.0780,0.1840];

data = struct('A_d',A_d,'B_d',B_d,'C_d',C_d,'E_d', E_d, 'Q',Q,'R_rad_d', R_rad_d,'P_0',P_0,'x_0',x_0, 'I', eye(5));

sim('p5p5d.slx')
sim('p5p5e_1.slx')
%5 d
t=compass_course.time(1:5000);
psi_m_d=compass_course.signals.values(1:5000);
delta_m_d=rudder_input.signals.values(1:5000);
bias_est_d=bias_estimated.signals.values(1:5000);

%5e
psi_m_e=compass_course.signals.values(1:5000);
psi_est_e=psi_estimated.signals.values(1:5000);
delta_m_e=rudder_input.signals.values(1:5000);
bias_est_e=bias_estimated.signals.values(1:5000);


%Q tune 1
Q=[0 0;
    0 0];
data.Q=Q;
sim('p5p5d.slx')
sim('p5p5e_1.slx')
%5 f
t=compass_course.time(1:5000);
psi_m_d_f_1=compass_course.signals.values(1:5000);
delta_m_d_f_1=rudder_input.signals.values(1:5000);
bias_est_d_f_1=bias_estimated.signals.values(1:5000);

%5 f
psi_m_e_f_1=compass_course.signals.values(1:5000);
psi_est_e_f_1=psi_estimated.signals.values(1:5000);
delta_m_e_f_1=rudder_input.signals.values(1:5000);
bias_est_e_f_1=bias_estimated.signals.values(1:5000);

%{
%Q tune 2
Q=[30 0;
    0 10^-6];
data.Q=50*Q;

sim('p5p5d.slx')
sim('p5p5e_1.slx')
%5 f
t=compass_course.time(1:5000);
psi_m_d_f_2=compass_course.signals.values(1:5000);
delta_m_d_f_2=rudder_input.signals.values(1:5000);
bias_est_d_f_2=bias_estimated.signals.values(1:5000);

%5 f
psi_m_e_f_2=compass_course.signals.values(1:5000);
psi_est_e_f_2=psi_estimated.signals.values(1:5000);
delta_m_e_f_2=rudder_input.signals.values(1:5000);
bias_est_e_f_2=bias_estimated.signals.values(1:5000);

%Q tune 3 [20 0 0 10^-6] too little change
Q=[30 0;
    0 0];
data.Q=Q;

sim('p5p5d.slx')
sim('p5p5e_1.slx')
%5 f
t=compass_course.time(1:5000);
psi_m_d_f_3=compass_course.signals.values(1:5000);
delta_m_d_f_3=rudder_input.signals.values(1:5000);
bias_est_d_f_3=bias_estimated.signals.values(1:5000);

%5 f
psi_m_e_f_3=compass_course.signals.values(1:5000);
psi_est_e_f_3=psi_estimated.signals.values(1:5000);
delta_m_e_f_3=rudder_input.signals.values(1:5000);
bias_est_e_f_3=bias_estimated.signals.values(1:5000);

%Q tune 4

Q=[0 0;
    0 10^-6];
data.Q=Q;

sim('p5p5d.slx')
sim('p5p5e_1.slx')
%5 f
t=compass_course.time(1:5000);
psi_m_d_f_4=compass_course.signals.values(1:5000);
delta_m_d_f_4=rudder_input.signals.values(1:5000);
bias_est_d_f_4=bias_estimated.signals.values(1:5000);

%5 f
psi_m_e_f_4=compass_course.signals.values(1:5000);
psi_est_e_f_4=psi_estimated.signals.values(1:5000);
delta_m_e_f_4=rudder_input.signals.values(1:5000);
bias_est_e_f_4=bias_estimated.signals.values(1:5000);

%Q tune 5
Q=[0 0.18125;
    0.18125 10^-6];
data.Q=Q;

sim('p5p5d.slx')
sim('p5p5e_1.slx')
%5 f
t=compass_course.time(1:5000);
psi_m_d_f_5=compass_course.signals.values(1:5000);
delta_m_d_f_5=rudder_input.signals.values(1:5000);
bias_est_d_f_5=bias_estimated.signals.values(1:5000);

%5 f
psi_m_e_f_5=compass_course.signals.values(1:5000);
psi_est_e_f_5=psi_estimated.signals.values(1:5000);
delta_m_e_f_5=rudder_input.signals.values(1:5000);
bias_est_e_f_5=bias_estimated.signals.values(1:5000);

%Q tune 6
Q=[50*30 0;
    0 10^-6];
data.Q=Q;

sim('p5p5d.slx')
sim('p5p5e_1.slx')
%5 f
t=compass_course.time(1:5000);
psi_m_d_f_6=compass_course.signals.values(1:5000);
delta_m_d_f_6=rudder_input.signals.values(1:5000);
bias_est_d_f_6=bias_estimated.signals.values(1:5000);

%5 f
psi_m_e_f_6=compass_course.signals.values(1:5000);
psi_est_e_f_6=psi_estimated.signals.values(1:5000);
delta_m_e_f_6=rudder_input.signals.values(1:5000);
bias_est_e_f_6=bias_estimated.signals.values(1:5000);

%Q tune 7
Q=[30 0;
    0 50*10^-6];
data.Q=Q;

sim('p5p5d.slx')
sim('p5p5e_1.slx')
%5 f
t=compass_course.time(1:5000);
psi_m_d_f_7=compass_course.signals.values(1:5000);
delta_m_d_f_7=rudder_input.signals.values(1:5000);
bias_est_d_f_7=bias_estimated.signals.values(1:5000);

%5 f
psi_m_e_f_7=compass_course.signals.values(1:5000);
psi_est_e_f_7=psi_estimated.signals.values(1:5000);
delta_m_e_f_7=rudder_input.signals.values(1:5000);
bias_est_e_f_7=bias_estimated.signals.values(1:5000);

%Q tune 8
Q=[0 10^-6;
    10^-6 0];
data.Q=Q;

sim('p5p5d.slx')
sim('p5p5e_1.slx')

%5 f
t=compass_course.time(1:5000);
psi_m_d_f_8=compass_course.signals.values(1:5000);
delta_m_d_f_8=rudder_input.signals.values(1:5000);
bias_est_d_f_8=bias_estimated.signals.values(1:5000);

%5 f
psi_m_e_f_8=compass_course.signals.values(1:5000);
psi_est_e_f_8=psi_estimated.signals.values(1:5000);
delta_m_e_f_8=rudder_input.signals.values(1:5000);
bias_est_e_f_8=bias_estimated.signals.values(1:5000);
%}
%plot d and f
%\psi

figure;
hold on;
title({'\psi with original Q matrix and tuned Q matrix.';'Current disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m_d);
plot(t, psi_m_d_f_1);
%plot(t, psi_m_d_f_2);
%plot(t, psi_m_d_f_3);
%plot(t, psi_m_d_f_4);
%plot(t, psi_m_d_f_5);
%plot(t, psi_m_d_f_6);
%plot(t, psi_m_d_f_7);
%plot(t, psi_m_d_f_8);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi with Q_0',...
    '\psi with Q_1','\psi with Q_2',...
    '\psi with Q_3','\psi with Q_4',...
    '\psi with Q_5','\psi with Q_6',...
    '\psi with Q_7','\psi with Q_8';});
hold off;

%\delta
figure;
hold on;
title({'\delta with original Q matrix and tuned Q matrix.';'Current disturbance'});
plot(t,delta_m_d,t,bias_est_d);
plot(t, delta_m_d_f_1,t,bias_est_d_f_1);
%plot(t, delta_m_d_f_2,t,bias_est_d_f_2);
%plot(t, delta_m_d_f_3,t,bias_est_d_f_3);
%plot(t, delta_m_d_f_4,t,bias_est_d_f_4);
%plot(t, delta_m_d_f_5,t,bias_est_d_f_5);
%plot(t, delta_m_d_f_6,t,bias_est_d_f_6);
%plot(t, delta_m_d_f_7,t,bias_est_d_f_7);
%plot(t, delta_m_d_f_8,t,bias_est_d_f_8);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta with Q_0','Estimated bias with Q_0',...
    '\delta with Q_1','Estimated bias with Q_1',...
    '\delta with Q_2','Estimated bias with Q_2',...
    '\delta with Q_3','Estimated bias with Q_3',...
    '\delta with Q_4','Estimated bias with Q_4',...
    '\delta with Q_5','Estimated bias with Q_5',...
    '\delta with Q_6','Estimated bias with Q_6',...
    '\delta with Q_7','Estimated bias with Q_7',...
    '\delta with Q_8','Estimated bias with Q_8';});
hold off;

%plot e and f
%\psi
figure;
hold on;
title({'\psi with original Q matrix and tuned Q matrix.';'Current and wave disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m_e,t, psi_est_e);
plot(t,psi_m_e_f_1,t,psi_est_e_f_1);
%plot(t,psi_m_e_f_2,t,psi_est_e_f_2);
%plot(t,psi_m_e_f_3,t,psi_est_e_f_3);
%plot(t,psi_m_e_f_4,t,psi_est_e_f_4);
%plot(t,psi_m_e_f_5,t,psi_est_e_f_5);
%plot(t,psi_m_e_f_6,t,psi_est_e_f_6);
%plot(t,psi_m_e_f_7,t,psi_est_e_f_7);
%plot(t,psi_m_e_f_8,t,psi_est_e_f_8);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi with original Q', '\psi with tuned Q','Estimated \psi with original Q','Estimated \psi with tuned Q'});
legend({'\psi_r','\psi with Q_0','estimated \psi with Q_0',...
    '\psi with Q_1','estimated \psi with Q_1',...
    '\psi with Q_2','estimated \psi with Q_2',...
    '\psi with Q_3','estimated \psi with Q_3',...
    '\psi with Q_4','estimated \psi with Q_4',...
    '\psi with Q_5','estimated \psi with Q_5',...
    '\psi with Q_6','estimated \psi with Q_6',...
    '\psi with Q_7','estimated \psi with Q_7',...
    '\psi with Q_8','estimated \psi with Q_8';});
hold off;

%\delta
figure;
hold on;
title({'\delta with original Q matrix and tuned Q matrix.';'Current and wave disturbance'});
plot(t,delta_m_e, t, bias_est_e);
plot(t,delta_m_e_f_1,t,bias_est_e_f_1);
%plot(t,delta_m_e_f_2,t,bias_est_e_f_2);
%plot(t,delta_m_e_f_3,t,bias_est_e_f_3);
%plot(t,delta_m_e_f_4,t,bias_est_e_f_4);
%plot(t,delta_m_e_f_5,t,bias_est_e_f_5);
%plot(t,delta_m_e_f_6,t,bias_est_e_f_6);
%plot(t,delta_m_e_f_7,t,bias_est_e_f_7);
%plot(t,delta_m_e_f_8,t,bias_est_e_f_8);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta with Q_0','Estimated bias with Q_0',...
    '\delta with Q_1','Estimated bias with Q_1',...
    '\delta with Q_2','Estimated bias with Q_2',...
    '\delta with Q_3','Estimated bias with Q_3',...
    '\delta with Q_4','Estimated bias with Q_4',...
    '\delta with Q_5','Estimated bias with Q_5',...
    '\delta with Q_6','Estimated bias with Q_6',...
    '\delta with Q_7','Estimated bias with Q_7',...
    '\delta with Q_8','Estimated bias with Q_8';});
hold off;

