% run the vehicle stage 3 model before this 
%Adding engine, gear box, final drive and drive line to the model
% realistic pass.car value
function dvdt = vehicle_stage4(t, v)

m = 1800;      %Vehicle Mass(KG)
g = 9.81 ;     %gravity (m/s^2)
Crr = 0.015;   % rolling Resistance
rho = 1.225;   % air density (kg/m^3)
Cd = 0.32;     % drag coeffcient
A = 2.2;       % frontal area (m^2)
R_w = 0.3;     % Wheel Radius (m)


%----Driveline Parameter-----
gear_ratio = 3.5;   %single fixed gear
final_drive = 4.1;
eta = 0.9;

%---driver Throttle-----
Throttle = 0.5; % throttle (0-1)

%-----engine speed----
omega_e = (v/R_w)*gear_ratio*final_drive;     %rad/s
rpm_e = omega_e*60 /(2*pi);

%-----engine Torque Model------
T_max = 200;   %Nm
if rpm_e < 4000
    T_engine = Throttle*T_max;
else
    T_engine = Throttle*T_max *(1 - (rpm_e - 4000)/3000);
    T_engine = max(T_engine,0);
end

%-------wheel Torque-----
T_wheel = T_engine * gear_ratio * final_drive * eta;

%---max driving_Forces-----
F_max = T_wheel / R_w; %Calculatedcan  traction force (N)

F_drive = Throttle * F_max; 
%----Resistive_Forces-----
F_roll = Crr * m * g;
F_aero = 0.5 * rho * Cd * A * v^2;

%----Net_Forces-----
F_net = F_drive - (F_roll + F_aero);

%----Acceleration-----
dvdt = F_net/m;

end