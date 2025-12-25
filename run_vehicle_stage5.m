tspan = [0,80];
x0 = 0;

[t,x] = ode45(@vehicle_stage5,tspan, x0);

v = x(:,1);

%------plot 1 : speed ---------
figure;
plot(t,v)
xlabel('Time (S)');
ylabel('Speed (m/s)');
title('Stage 5: Vehicle Speed with Engine & Multi - Gears')
grid on

%------plot 1 : gear vs time ---------
figure;
plot(t_log,gear_log);
xlabel('Time (S)');
ylabel('Gear ');
title('gear selection vs time')
grid on