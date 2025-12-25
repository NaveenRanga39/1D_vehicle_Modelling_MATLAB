% run the vehicle stage 2 model before this 
%Adding realstic to the simple vehicle model driver input (throttle) 
% realistic pass.car value
function dvdt = vehicle_stage3(t, v)

m = 1800;      %Vehicle Mass(KG)
g = 9.81 ;     %gravity (m/s^2)
Crr = 0.015;   % rolling Resistance
rho = 1.225;   % air density (kg/m^3)
Cd = 0.32;     % drag coeffcient
A = 2.2;       % frontal area (m^2)

%---driver Throttle-----
Throttle = 0.50; % throttle (0-1)

%---max driving_Forces-----
F_max = 2000; %constant traction force (N)

F_drive = Throttle * F_max; 
%----Resistive_Forces-----
F_roll = Crr * m * g;
F_aero = 0.5 * rho * Cd * A * v^2;

%----Net_Forces-----
F_net = F_drive - (F_roll + F_aero);

%----Acceleration-----
dvdt = F_net/m;

end