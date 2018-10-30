%Task 5.5 a
sim('p5p5b.mdl')
%Declaring variables
K=0.1561;
T=72.4347;

%estimate of measurement noise in deg^2
%plot(compass_m_noise.time,compass_m_noise.signals.values);
R_deg=var(compass_m_noise.signals.values);
R_rad=(sqrt(R_deg)*pi/180)^2;
