% run the vehicle stage 1 model before this 
%Adding realstic to the simple vehicle model (Rolling + Resistent) 
% realistic pass.car value
function dvdt = simple_vehicle_1(t, v)

m = 1800;      %Vehicle Mass(KG)
g = 9.81 ;     %gravity (m/s^2)
Crr = 0.015;   % rolling Resistance
rho = 1.225;   % air density (kg/m^3)
Cd = 0.32;     % drag coeffcient
A = 2.2;       % frontal area (m^2)

%---driving_Forces-----
F_drive = 2000; %constant traction force (N)

%----Resistive_Forces-----
F_roll = Crr * m * g;
F_aero = 0.5 * rho * Cd * A * v^2;

%----Net_Forces-----
F_net = F_drive - (F_roll + F_aero);

%----Acceleration-----
dvdt = F_net/m;

end