%Task 5.5 d
run('p5p5c.m')

%Values from feed forward with Kalman filter
sim('p5p5dx.mdl')
t=compass_course.time(1:5000);
psi_m=compass_course.signals.values(1:5000);
delta_m=rudder_input.signals.values(1:5000);
bias_est=bias_estimated.signals.values(1:5000);

sim('../problem_5_3/p5p3cx.mdl')
%Values from PD regulator, no Kalman filter
psi_m_pd=compass_pd.signals.values(1:5000);
delta_m_pd=rudder_pd.signals.values(1:5000);
t_pd=rudder_pd.time(1:5000); %same as t, just to verify

%\psi
figure;
hold on;
title({'\psi with and without feed forward from bias estimated with Kalman flter.';'Current disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m,'b',t_pd, psi_m_pd,'--g');
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi measured with feed forward', '\psi measured without feed forward'});
hold off;

%\delta
figure;
hold on;
title({'\delta with and without feed forward from bias estimated with Kalman flter.';'Current disturbance'});
plot(t,delta_m,'b', t_pd, delta_m_pd,'--g');
plot(t,bias_est,'m');
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta measured with feed forward','\delta measured without feed forward','Estimated bias'});
hold off;

%\psi and \delta together
figure;
hold on;
title({'\psi and \delta with and without feed forward from bias estimated with Kalman flter.';'Current disturbance'});
%plot \psi
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m,'b',t_pd, psi_m_pd,'--g');
%plot \delta
plot(t,delta_m,'k',t_pd, delta_m_pd,'--y');
plot(t,bias_est,'m');
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi measured with feed forward', '\psi measured without feed forward', '\delta measured with feed forward','\delta measured without feed forward','Estimated bias'});
hold off;
