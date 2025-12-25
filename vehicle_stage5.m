% run the vehicle stage 4 model before this 
%Adding Multi Gear Transmission
% realistic pass.car value
function dvdt = vehicle_stage5(t, x)

%------state------
v = x(1); %vehicle speed

%-------vehicle parameter-------
m = 1800;      %Vehicle Mass(KG)
g = 9.81 ;     %gravity (m/s^2)
Crr = 0.015;   % rolling Resistance
rho = 1.225;   % air density (kg/m^3)
Cd = 0.32;     % drag coeffcient
A = 2.2;       % frontal area (m^2)
R_w = 0.3;     % Wheel Radius (m)


%----Driveline Parameter-----
gear_ratio = [3.5 2.2 1.2 1.0 0.8 5.0];   %single fixed gear
final_drive = 4.1;
eta = 0.9;

%------Persistenet log--------
persistent t_log gear_log v_log rpm_log
if isempty(t_log)
    t_log = [];
    gear_log = [];
    v_log = [];
    rpm_log = [];
end

%------Gear state--------
persistent gear
if isempty(gear)
    gear = 1;
end

%---driver Throttle-----
Throttle = 0.5; % throttle (0-1)

%-----engine speed----
omega_e = (v/R_w)*gear_ratio(gear)*final_drive;     %rad/s
rpm_e = omega_e*60 /(2*pi);

%------Shift Logic-----
rpm_up = 6000;
rpm_down = 2000;

if rpm_e > rpm_up && gear < length(gear_ratio)
    gear = gear+1;
    
elseif rpm_e < rpm_down && gear > 1
    gear = gear - 1; 
end

%-----engine Torque Model------
T_max = 200;   %Nm
if rpm_e < 4000
    T_engine = Throttle*T_max;
else
    T_engine = Throttle*T_max *(1 - (rpm_e - 4000)/3000);
    T_engine = max(T_engine,0);
end

%-------wheel Torque-----
T_wheel = T_engine * gear_ratio(gear) * final_drive * eta;

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

dxdt = zeros(1,1);
dxdt(1) = dvdt;

%----logging-----------
t_log(end+1) = t;
v_log(end+1) = v;
rpm_log(end+1) = rpm_e;
gear_log(end+1) = gear;

assignin('base','t_log',t_log);
assignin('base','v_log',v_log);
assignin('base','rpm_log',rpm_log);
assignin('base','gear_log',gear_log);

end