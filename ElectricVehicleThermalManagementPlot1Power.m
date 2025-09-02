%% Plot Description:
%
% This plot shows the power consumed by the thermal management system to
% cool the vehicle components and cabin. The largest power consumption
% occurs in the refrigerant compressor when the chiller is used to cool the
% batteries.

% Copyright 2021-2023 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_ElectricVehicleThermalManagement', 'var')
    sim('ElectricVehicleThermalManagement')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_ElectricVehicleThermalManagement', 'var') || ...
        ~isgraphics(h1_ElectricVehicleThermalManagement, 'figure')
    h1_ElectricVehicleThermalManagement = figure('Name', 'ElectricVehicleThermalManagement');
end
figure(h1_ElectricVehicleThermalManagement)
clf(h1_ElectricVehicleThermalManagement)

plotPower(simlog_ElectricVehicleThermalManagement)



% Plot power consumption
function plotPower(simlog)

% Get simulation results
t = simlog.Compressor.Positive_Displacement_Compressor_2P.mechanical_power.series.time;
W_comp = simlog.Compressor.Positive_Displacement_Compressor_2P.mechanical_power.series.values('W');
W_pump_motor = simlog.Motor_Pump.Motor_Pump.mechanical_power.series.values('W');
W_pump_battery = simlog.Battery_Pump.Battery_Pump.mechanical_power.series.values('W');
W_fan = simlog.Condenser.Fan.mechanical_power.series.values('W');
W_blower = simlog.Blower.Blower.power.series.values('W');
W_total = W_comp + W_pump_motor + W_pump_battery + W_fan + W_blower;

% Plot results
plot(t, W_comp, 'LineWidth', 1)
hold on
plot(t, W_pump_motor, 'LineWidth', 1)
plot(t, W_pump_battery, 'LineWidth', 1)
plot(t, W_fan, 'LineWidth', 1)
plot(t, W_blower, 'LineWidth', 1)
plot(t, W_total, 'k', 'LineWidth', 2)
hold off
grid on
legend('Compressor', 'Motor Pump', 'Battery Pump', 'Fan', 'Blower', 'Total', 'Location', 'best')
xlabel('Time (s)')
title('Power Consumed (W)')

end
