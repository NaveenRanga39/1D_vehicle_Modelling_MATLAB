tspan = [0,20];
v0 = 0;

[t,v] = ode45(@vehicle_stage1,tspan, v0);

plot(t,v)
xlabel('Time (S)');
ylabel('velocity (m/s)');
title('Stage 1: Time vs Velocity')
grid on