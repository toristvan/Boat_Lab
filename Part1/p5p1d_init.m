
%define variables
K=0.1561;
T=72.4347;


sim('p5p1d.mdl')

figure;
hold on
title({'Comparison between step response of the model';
    'and the response of the ship'})
plot(transf_compass_step.time,transf_compass_step.signals.values,'r');
plot(ship_compass_step.time, ship_compass_step.signals.values,'b');
xlabel('$Time [s]$', 'Interpreter', 'latex');
ylabel('$\psi [deg]$', 'Interpreter', 'latex');
legend({'Step response of model';'Step response of ship'});
hold off