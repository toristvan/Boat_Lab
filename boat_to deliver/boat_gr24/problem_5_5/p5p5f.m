%Task 5.5 f
run('p5p5c.m');

sim('p5p5dx.mdl')
sim('p5p5e_1x.mdl')
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

%tune Q1 and get values
Q=[0 0;
    0 0];
data.Q=Q;
sim('p5p5dx.mdl')
sim('p5p5e_1x.mdl')
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


%tune Q2 and get values
Q=[30 0;
    0 10^-6];
data.Q=50*Q;

sim('p5p5dx.mdl')
sim('p5p5e_1x.mdl')
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

%plot for Q1
%d psi
figure;
subplot(2,2,1)
hold on;
title({'\psi with original Q_0 and Q_1.';'Current disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m_d);
plot(t, psi_m_d_f_1);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi with Q_0','\psi with Q_1'});
hold off;
%d delta
subplot(2,2,2);
hold on;
title({'\delta with original Q_0 and Q_1.';'Current disturbance'});
plot(t,delta_m_d,'--',t,bias_est_d);
plot(t, delta_m_d_f_1,'--',t,bias_est_d_f_1);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta with Q_0','Estimated bias with Q_0',...
    '\delta with Q_1','Estimated bias with Q_1'})
hold off
%e psi
subplot(2,2,3);
hold on;
title({'\psi with original Q_0 and Q_1.';'Current and wave disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m_e,'--',t, psi_est_e);
plot(t,psi_m_e_f_1,'--',t,psi_est_e_f_1);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi with Q_0','estimated \psi with Q_0',...
    '\psi with Q_1','estimated \psi with Q_1'});
hold off;
%e delta
subplot(2,2,4);
hold on;
title({'\delta with original Q_0 and Q_1.';'Current and wave disturbance'});
plot(t,delta_m_e,'--', t, bias_est_e);
plot(t,delta_m_e_f_1,'--',t,bias_est_e_f_1);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta with Q_0','Estimated bias with Q_0',...
    '\delta with Q_1','Estimated bias with Q_1'});
hold off;

%Plot for Q2
%d psi
figure;
subplot(2,2,1)
hold on;
title({'\psi with original Q_0 and Q_2.';'Current disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m_d);
plot(t, psi_m_d_f_2);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi with Q_0','\psi with Q_2'});
hold off;
%d delta
subplot(2,2,2);
hold on;
title({'\delta with original Q_0 and Q_2.';'Current disturbance'});
plot(t,delta_m_d,'--',t,bias_est_d);
plot(t, delta_m_d_f_2,'--',t,bias_est_d_f_2);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta with Q_0','Estimated bias with Q_0',...
    '\delta with Q_2','Estimated bias with Q_2'})
hold off
%e psi
subplot(2,2,3);
hold on;
title({'\psi with original Q_0 and Q_2.';'Current and wave disturbance'});
plot(t, psi_ref*ones(5000,1),'--r');
plot(t,psi_m_e,'--',t, psi_est_e);
plot(t,psi_m_e_f_2,'--',t,psi_est_e_f_2);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\psi_r','\psi with Q_0','estimated \psi with Q_0',...
    '\psi with Q_2','estimated \psi with Q_2'});
hold off;
%e delta
subplot(2,2,4);
hold on;
title({'\delta with original Q_0 and Q_2.';'Current and wave disturbance'});
plot(t,delta_m_e,'--', t, bias_est_e);
plot(t,delta_m_e_f_2,'--',t,bias_est_e_f_2);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$Angle [deg]$', 'Interpreter', 'latex');
legend({'\delta with Q_0','Estimated bias with Q_0',...
    '\delta with Q_2','Estimated bias with Q_2'});
hold off;


