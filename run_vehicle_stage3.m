tspan = [0,60];
v0 = 0;

[t,v] = ode45(@vehicle_stage3,tspan, v0);

plot(t,v)
xlabel('Time (S)');
ylabel('Speed (m/s)');
title('Stage 3: Vehicle Speed with Throttle Input')
grid on