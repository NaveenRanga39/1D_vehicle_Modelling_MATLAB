tspan = [0,60];
v0 = 0;

[t,v] = ode45(@vehicle_stage2,tspan, v0);

plot(t,v)
xlabel('Time (S)');
ylabel('Speed (m/s)');
title('Stage 2: Vehicle Speed with Resistance Input')
grid on