#1D_vehicle_Modelling_MATLAB

This repository contains a physics-based 1D longitudinal vehicle model developed in MATLAB (R2021). 
The project demonstrates system-level vehicle modeling using force and torque balance principles, suitable for concept evaluation, performance analysis, and energy studies.

Stage 1 : 
F = mv ( Force = Mass * Velocity)
velocity changes with time so matlab uses ode45 to solve dv/dt

Stage 2 : 
Adding Realistic to the model Rolling Resistance + Aerodynamic drag

Stage 3 : Adding Throttle

Stage 4 : Force applied directly to the vehicle
in this stage simple(Engine, Gearbox, Final drive) added to the model

Engine Part : Below 4000 RPM can drive full torque
mimcs the Flat torque region (if part)

above 4000 RPM torque decreases linerly 
mimcs mechanical constrains (else part)

stage 5 : Added Multi gear ratio. 
used persistent (memory based logic method)
persistent is the correct modeling choice for discrete control logic.

also added a logging in this stage to check the time vs gear plot
