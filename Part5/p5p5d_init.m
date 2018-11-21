%Task 5.5 d

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

%Values from feed forward with Kalman filter
%sim('p5p5d.slx')
t=compass_course.time(1:5000);
psi_m=compass_course.signals.values(1:5000);
delta_m=rudder_input.signals.values(1:5000);
bias_est=bias_estimated.signals.values(1:5000);
%load('../Part3/p5p3c.mdl')
%sim('../Part3/p5p3c.mdl')
%Values from PD regulator, no Kalman filter
psi_m_pd=compass_pd.signals.values(1:5000);
delta_m_pd=rudder_pd.signals.values(1:5000);
%t_d maybe not needed
t_pd=rudder_pd.time(1:5000);

figure;
hold on;
title({'\psi with and without feed forward from bias estimated form Kalman flter';'with current disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m,'b',t_pd, psi_m_pd,'g')
xlabel('$Time/s$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi measured with feed forward', '\psi measured without feed forward'});
hold off;

figure;
hold on;
title({'\delta with and without feed forward from bias estimated form Kalman flter';'with current disturbance'});
plot(t,delta_m,'b', t_pd, delta_m_pd,'g');
plot(t,bias_est,'m');
xlabel('$Time/s$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta measured with feed forward','\delta measured without feed forward','Estimated bias'});
hold off;
