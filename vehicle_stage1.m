% run the simple vehicle model  
% F = m*v (Force = Mass * velocity) 
function dvdt = vehicle_stage1(t, v)
m = 1000;
F = 2000;
dvdt = F/m ;
end
