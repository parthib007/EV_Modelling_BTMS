%% Model

open_system('ElectricVehicleThermalManagement')

set_param(find_system(bdroot,'FindAll','on','type','annotation','Tag','ModelFeatures'),'Interpreter','off');

%% Scenario Subsystem
%
% This subsystem sets up the environment conditions and inputs to the
% system for the selected scenario. The battery current demand and
% powertrain heat load are a function of the vehicle speed based on
% tabulated data.

open_system('ElectricVehicleThermalManagement/Scenario','force')

%% Controls Subsystem
%
% This subsystem consists of all of the controllers for the pumps,
% compressor, fan, blower, and valves in the thermal management system.

open_system('ElectricVehicleThermalManagement/Controls','force')

%% Parallel-Serial Mode Valve Subsystem
%
% The 4-way valve in this subsystem controls whether the coolant loop
% operates in parallel or serial mode. When ports A and D are connected and
% ports C and B are connected, it is in parallel mode. The two coolant
% loops are separated with their own coolant tanks and pumps.
%
% When ports A and B are connected and ports C and D are connected, it is
% in serial mode. The two coolant loops are merged and the two pumps are
% synchronized to provide the same flow rate.

open_system('ElectricVehicleThermalManagement/Parallel-Serial Mode Valve','force')

%% Motor Pump Subsystem
%
% This pump drives the coolant loop that cools the charger, motor, and
% inverter.

open_system('ElectricVehicleThermalManagement/Motor Pump','force')

%% Charger Subsystem
%
% This subsystem models a coolant jacket around the charger, which is
% represented by a heat flow rate source and a thermal mass.

open_system('ElectricVehicleThermalManagement/Charger','force')

%% Motor Subsystem
%
% This subsystem models a coolant jacket around the motor, which is
% represented by a heat flow rate source and a thermal mass.

open_system('ElectricVehicleThermalManagement/Motor','force')

%% Inverter Subsystem
%
% This subsystem models a coolant jacket around the inverter, which is
% represented by a heat flow rate source and a thermal mass.

open_system('ElectricVehicleThermalManagement/Inverter','force')

%% Radiator Subsystem
%
% The radiator is a rectangular tube-and-fin type heat exchanger that
% dissipates coolant heat to the air. The air flow is driven by the vehicle
% speed and the fan located behind the condenser.

open_system('ElectricVehicleThermalManagement/Radiator','force')

%% Radiator Bypass Valve Subsystem
%
% In cold weather, the radiator is bypassed so that heat from the
% powertrain can be used to warm up the batteries. This is controlled by
% the 3-way valve that either sends coolant to the radiator or bypasses the
% radiator.

open_system('ElectricVehicleThermalManagement/Radiator Bypass Valve','force')

%% Battery Pump Subsystem
%
% This pump drives the coolant loop that cools the batteries and the DC-DC
% converter.

open_system('ElectricVehicleThermalManagement/Battery Pump','force')

%% Chiller Subsystem
%
% The chiller is assumed to be a shell-and-tube type heat exchanger that
% lets the refrigerant absorb heat from the coolant.

open_system('ElectricVehicleThermalManagement/Chiller','force')

%% Chiller Bypass Valve Subsystem
%
% The chiller operates in an on-off manner depending on the battery
% temperature. This is controlled by the 3-way valve that either sends
% coolant to the chiller or bypasses the chiller.

open_system('ElectricVehicleThermalManagement/Chiller Bypass Valve','force')

%% Heater Subsystem
%
% The battery heater is modeled as a heat flow rate source and a thermal
% mass. It is turned on in cold weather to bring the battery temperature
% above 5 degC.

open_system('ElectricVehicleThermalManagement/Heater','force')

%% DCDC Subsystem
%
% This subsystem models a coolant jacket around the DC-DC converter, which
% is represented by a heat flow rate source and a thermal mass.

open_system('ElectricVehicleThermalManagement/DCDC','force')

%% Battery Subsystem
%
% The batteries are modeled as four separate packs surrounded by a coolant
% jacket. The battery packs generate voltage and heat based on the current
% demand. The coolant is assumed to flow in narrow channels around the
% battery packs.

open_system('ElectricVehicleThermalManagement/Battery','force')

%% Pack 1 Subsystem
%
% Each battery pack is modeled as a stack of lithium-ion cells coupled with
% a thermal model. Heat is generated based on the power losses in the
% cells.

open_system('ElectricVehicleThermalManagement/Battery/Pack 1','force')

%% Compressor Subsystem
%
% The compressor drives the flow in the refrigerant loop. It is controlled
% to maintain a pressure of 0.3 MPa in the chiller and the evaporator,
% which corresponds to a saturation temperature of around 1 degC.

open_system('ElectricVehicleThermalManagement/Compressor','force')

%% Condenser Subsystem
%
% The condenser is a rectangular tube-and-fin type heat exchanger that
% dissipates refrigerant heat to the air. The air flow is driven by the
% vehicle speed and the fan. The liquid receiver provides storage for the
% refrigerant and permits only subcooled liquid to flow into the expansion
% valves.

open_system('ElectricVehicleThermalManagement/Condenser','force')

%% Chiller Expansion Valve Subsystem
%
% This expansion valve meters refrigerant flow to the chiller to maintain a
% nominal superheat.

open_system('ElectricVehicleThermalManagement/Chiller Expansion Valve','force')

%% Evaporator Expansion Valve Subsystem
%
% This expansion valve meters refrigerant flow to the evaporator to
% maintain a nominal superheat.

open_system('ElectricVehicleThermalManagement/Evaporator Expansion Valve','force')

%% Evaporator Subsystem
%
% The evaporator is a rectangular tube-and-fin type heat exchanger that
% lets the refrigerant absorb heat from the air. It also dehumidifies the
% air when the air is humid.

open_system('ElectricVehicleThermalManagement/Evaporator','force')

%% Blower Subsystem
%
% The blower drives the air flow in the HVAC loop. It is controlled to
% maintain the cabin temperature setpoint. The source of air can come from
% the environment or from recirculated cabin air.

open_system('ElectricVehicleThermalManagement/Blower','force')

%% Recirculation Flap Subsystem
%
% The recirculation flap is modeled as two restrictions operating in the
% opposite manner to let either environment air or cabin air to the blower.

open_system('ElectricVehicleThermalManagement/Blower/Recirculation Flap','force')

%% PTC Subsystem
%
% The PTC heater is modeled as a heat flow rate source and a thermal mass.
% It is turned on in cold weather to provide heating to the vehicle cabin.

open_system('ElectricVehicleThermalManagement/PTC','force')

%% Cabin Subsystem
%
% The vehicle cabin is modeled as a large volume of moist air. Each
% occupant in the vehicle is a source of heat, moisture, and CO2.

open_system('ElectricVehicleThermalManagement/Cabin','force')

%% Cabin Heat Transfer Subsystem
%
% This subsystem models the thermal resistances between the cabin interior
% and the external environment.

open_system('ElectricVehicleThermalManagement/Cabin/Cabin Heat Transfer','force')

%% Simulation Results from Scopes
%
% The following scope shows the vehicle speed, heat dissipation, cabin
% temperature, component temperatures, and control commands for the drive
% cycle scenario. At the beginning, the coolant loop is in serial mode.
% After about 1100 s, it switches to parallel mode and the chiller is used
% to keep the batteries below 35 degC.

set_param('ElectricVehicleThermalManagement/Scope','open','on');
sim('ElectricVehicleThermalManagement');

%% 

set_param('ElectricVehicleThermalManagement/Scope','open','off');
%% Simulation Results from Simscape Logging
%%
%
% This plot shows the power consumed by the thermal management system to
% cool the vehicle components and cabin. The largest power consumption
% occurs in the refrigerant compressor when the chiller is used to cool the
% batteries.
%


ElectricVehicleThermalManagementPlot1Power;

%%
