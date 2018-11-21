%Task 5.5 b
sim('p5p5b.mdl')

%estimate of measurement noise in deg^2
%plot(compass_m_noise.time,compass_m_noise.signals.values);
R_deg=var(compass_m_noise.signals.values); %=0.5338
R_rad=(sqrt(R_deg)*pi/180)^2; %=1.6262*10^-4
