%Task 5.5 e plotting

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

sim('p5p5e_1.slx')
%Values for task 5.5 e with psi_ref=30
t=compass_course.time(1:5000);
psi_m=compass_course.signals.values(1:5000);
psi_est=psi_estimated.signals.values(1:5000);
delta_m=rudder_input.signals.values(1:5000);
bias_est=bias_estimated.signals.values(1:5000);

sim('../Part3/p5p3d.mdl')
psi_m_pd=compass_pd.signals.values(1:5000);
delta_m_pd=rudder_pd.signals.values(1:5000);
%t_d maybe not needed
t_pd=compass_pd.time(1:5000);

sim('p5p5e_2.slx')
psi_m_act=compass_course.signals.values(1:5000);
psi_est_act=psi_estimated.signals.values(1:5000);

figure;
hold on;
title({'\psi with and withour Kalman filter';'with current and wave disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m,'b',t,psi_est,'m',t_pd, psi_m_pd,'g')
xlabel('$Time/s$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi measured with Kalman filter','\psi estimated with Kalman filter', '\psi measured without Kalman filter'});
hold off;

figure;
hold on;
title({'\delta with and without Kalman flter';'with current and wave disturbance'});
plot(t,delta_m,'b', t_pd, delta_m_pd,'g');
plot(t,bias_est,'m');
xlabel('$Time/s$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta measured with Kalman filter','\delta measured without Kalman filter','Estimated bias'});
hold off;

figure;
hold on;
title({'Compass actual wave disturbance with Kalman filter'});
plot(t,psi_m_act,'b', t, psi_est_act,'r');
xlabel('$Time/s$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'Compass measured','Compass estimated'});
hold off;



