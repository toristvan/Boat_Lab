
%Task 1b

%defining variables
sim_samples=10000;
omega_1=0.005;
omega_2=0.05;
assignin('base','freq', omega_1)
%assignin('base','freq', omega_2)
sim('p5p1b.mdl')
% plotting figures and obtaining values
%to workspace
figure;
hold on
title({'Output \psi with input \delta as a sine with \omega_1 = 0.005 rad/s.';'No disturbances'});
plot(ws_compass_1.time,ws_compass_1.signals.values);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
%legend({'\psi'});
hold off


figure;
hold on
title({'Output \psi with input \delta as a sine with \omega_2 = 0.05.';'No disturbances'})
plot(ws_compass_2.time,ws_compass_2.signals.values);
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
%legend({'\psi'});
hold off

%to file
%{
figure;
hold on
title('Output with sine input with \omega_1 = 0.005')
A_1 = plot_and_amp(compass_1,sim_samples,2000);
xlabel('$Time/s$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
legend({'\psi'});
hold off

figure;
hold on
title('Output with sine input with \omega_2 = 0.05')
A_2 = plot_and_amp(compass_2,sim_samples,2000);
xlabel('$Time/s$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
legend({'\psi'});
hold off
%}
A_1= (max(ws_compass_1.signals.values(2000:end))-min(ws_compass_1.signals.values(2000:end)))/2;
A_2= (max(ws_compass_2.signals.values(2000:end))-min(ws_compass_2.signals.values(2000:end)))/2;


%Calculating K and T

syms K_temp T_temp
eqns = [K_temp == A_1*omega_1*sqrt(T_temp^2*omega_1^2+1),
    T_temp == sqrt(((K_temp/(A_2*omega_2))^2-1)/omega_2^2)];
vars = [K_temp T_temp];
[solv, solu] = (solve(eqns, vars));

K=0.1561;
T=72.4347;


