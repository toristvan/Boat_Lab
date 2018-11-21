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

Q=[30 0;
    0 10^-6];

sim('p5p5d.slx')
sim('p5p5e_1.slx')
%5 f
t=compass_course.time(1:5000);
psi_m_d_f=compass_course.signals.values(1:5000);
delta_m_d_f=rudder_input.signals.values(1:5000);
bias_est_d_f=bias_estimated.signals.values(1:5000);

%5 f
psi_m_e_f=compass_course.signals.values(1:5000);
psi_est_e_f=psi_estimated.signals.values(1:5000);
delta_m_e_f=rudder_input.signals.values(1:5000);
bias_est_e_f=bias_estimated.signals.values(1:5000);

%plot d and f
%\psi
figure;
hold on;
title({'\psi with original Q matrix and tuned Q matrix.';'Current disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m_d,'b',t, psi_m_d_f,'--g');
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi with original Q', '\psi with tuned Q'});
hold off;

%\delta
figure;
hold on;
title({'\delta with original Q matrix and tuned Q matrix.';'Current disturbance'});
plot(t,delta_m_d,'b', t, delta_m_d_f,'--g');
plot(t,bias_est_d,'m',t,bias_est_d_f,'--c');
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta with original Q','\delta with tuned Q','Estimated bias with original Q','Estimated bias with tuned Q'});
hold off;

%plot e and f
%\psi
figure;
hold on;
title({'\psi with original Q matrix and tuned Q matrix.';'Current and wave disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m_e,'b',t, psi_m_e_f,'--g');
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi with original Q', '\psi with tuned Q'});
hold off;

%\delta
figure;
hold on;
title({'\delta with original Q matrix and tuned Q matrix.';'Current and wave disturbance'});
plot(t,delta_m_e,'b', t, delta_m_e_f,'--g');
plot(t,bias_est_e,'m',t,bias_est_e_f,'--c');
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta with original Q','\delta with tuned Q','Estimated bias with original Q','Estimated bias with tuned Q'});
hold off;

