%Task 5.3 c

%From task 1
K=0.1561;
T=72.4347;

%Values for PD-regulator

T_d=T; %to cancel time constant of transfer function
%T_f=8.39130;
T_f=-10/tan(130*pi/180); %8.3910
%K_pd=0.8526;
K_pd=sqrt((0.01*T_f)^2+0.01)/K; %0.8363

%system constants
psi_ref=30; %degrees
PM=50; %degrees
omega_c=0.10; %rad/s cross frequency;

sim('p5p3dx.mdl')
%change sample values for to ws
t=compass_pd.time(1:5000);
psi_m=compass_pd.signals.values(1:5000);
delta_m=rudder_pd.signals.values(1:5000);

figure;
hold on;
title({'System with PD regulator with saturation for rudder.';'Wave disturbance and measurement noise'});
plot(t, psi_ref*ones(5000,1),'m');
plot(t,psi_m,'b',t,delta_m,'r');
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi','\delta'});
hold off;
