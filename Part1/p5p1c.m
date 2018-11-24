%Task 1c
%sim('p5p1c.mdl')

%defining variables
sim_samples=10000;
omega_1=0.005;
omega_2=0.05;
assignin('base','freq', omega_1)
sim('p5p1c.mdl')

%plotting figures and obtaining values
%to workspace
%omega 1
figure;
hold on
title({'Output \psi with input \delta as a sine with \omega_1 = 0.005.';'Wave disturbance and measurement noise'});
plot(ws_compass_noise_1.time,ws_compass_noise_1.signals.values);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
%legend({'\psi'});
hold off

%omega_2
assignin('base','freq', omega_2)
sim('p5p1c.mdl')

figure;
hold on
title({'Output \psi with input \delta as a sine with \omega_1 = 0.005.';'Wave disturbance and measurement noise'});
plot(ws_compass_noise_1.time,ws_compass_noise_1.signals.values);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
%legend({'\psi'});
hold off

%{
figure;
hold on
title({'Output \psi with input \delta as a sine with \omega_2 = 0.05.';'Disturbances: waves and measurement noise'});
plot(ws_compass_noise_2.time,ws_compass_noise_2.signals.values);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
%legend({'\psi'});
hold off
%}
%to file
%{
figure;
hold on
title('Output with sine input with \omega_1 = 0.005 with waves and noise')
A_1 = plot_and_amp(compass_noise_1,sim_samples,2000);
xlabel('$Time/s$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
legend({'\psi'});
hold off
figure;
hold on
title('Output with sine input with \omega_2 = 0.05  with waves and noise')
A_2 = plot_and_amp(compass_noise_2,sim_samples,2000);
xlabel('$Time/s$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
legend({'\psi'});
hold off
%}

A_1= (max(ws_compass_noise_1.signals.values(2000:end))-min(ws_compass_noise_1.signals.values(2000:end)))/2;
A_2= (max(ws_compass_noise_2.signals.values(2000:end))-min(ws_compass_noise_2.signals.values(2000:end)))/2;

%Possible to get good estimates for K and T
%with waves and measurement noise
%{
syms K_temp T_temp
eqns = [K_temp == A_1*omega_1*sqrt(T_temp^2*omega_1^2+1),
    T_temp == sqrt(((K_temp/(A_2*omega_2))^2-1)/omega_2^2)];
vars = [K_temp T_temp];
[solv, solu] = (solve(eqns, vars));

%}