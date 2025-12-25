tspan = [0,60];
v0 = 0;

[t,v] = ode45(@vehicle_stage4,tspan, v0);

plot(t,v)
xlabel('Time (S)');
ylabel('Speed (m/s)');
title('Stage 4: Vehicle Speed with Engine & Gears')
grid on