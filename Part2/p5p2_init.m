% Task 5.2 a

%Defining variables
fs = 10;
window = 4096;
samples = 100;


%Calculating PSD
[pxx, f] = pwelch(psi_w(2,:).*(pi/180), window, [], [], fs);

%Using scaling factors
omega = (2*pi.*f).';
pxx = (pxx./(2*pi)).';

%Plotting the figure

figure;
hold on
title('Estimated PSD')
plot(omega(1:samples), pxx(1:samples));
xlabel('$\omega [rad/s]$', 'Interpreter', 'latex');
ylabel('${S_\phi}_\omega [rad]$', 'Interpreter', 'latex');
%legend({''});
hold off

%Calculating omega_0
%{
max_1 = pxx(1);
index_1 = 1;
for i = 2:length(pxx)
    if pxx(i) > max_1
        max_1 = pxx(i);
        index_1 = i;
    end
end
omega_0 = omega(index_1);
%}
[max_pxx, index_max_pxx]=max(pxx);
omega_0=omega(index_max_pxx);
%max_1=max_pxx;
%index_1=index_max_pxx;
%Analytical PSD


%{
for i = 1:length(omega)
    x = omega(i);
    P(i)= (x^2*4*lambda^2*omega_0^2*max_1)/(x^4+omega_0^4+2*omega_0^2*x^2*(2*lambda^2-1));
end
%}


P_1 = make_analytical(0.05, omega, omega_0, max_pxx);
P_2 = make_analytical(0.09, omega, omega_0, max_pxx);
P_3 = make_analytical(0.1, omega, omega_0, max_pxx);
P_4 = make_analytical(0.2, omega, omega_0, max_pxx);
P_5 = make_analytical(0.3, omega, omega_0, max_pxx);

figure;
hold on
title('Analytical PSD')
plot(omega(1:samples), pxx(1:samples), 'LineWidth',1.5);
plot(omega(1:samples), P_1(1:samples),'--r');
plot(omega(1:samples), P_2(1:samples),'--m');
plot(omega(1:samples), P_3(1:samples),'--c');
plot(omega(1:samples), P_4(1:samples),'--y');
plot(omega(1:samples), P_5(1:samples),'--g');
xlabel('$\omega [rad/s]$', 'Interpreter', 'latex');
ylabel('${S_\phi}_\omega [rad]$', 'Interpreter', 'latex');
legend({'Estimated','$\lambda =0.05$','$\lambda =0.09$','$\lambda =0.1$','$\lambda =0.2$','$\lambda =0.3$'}, 'Interpreter', 'latex')
hold off 


%% implement curvefitlambda_try=lsqcurvefit