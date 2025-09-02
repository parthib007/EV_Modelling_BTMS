# Electric Vehicle and Battery Thermal Management in MATLAB/Simulink

This repository contains a high-fidelity **pure Electric Vehicle (EV)** model with a **liquid-based Battery Thermal Management System (BTMS)**. The project is built in **MATLAB, Simulink, and Simscape** to simulate vehicle dynamics and precisely control the battery temperature under various operating conditions.

---

## Table of Contents
- [Project Overview](#project-overview)
- [Technology Stack](#technology-stack)
- [Key Features](#key-features)
  - [1) Electric Vehicle Drivetrain Model](#1-electric-vehicle-drivetrain-model)
  - [2) Battery Thermal Management System (BTMS)](#2-battery-thermal-management-system-btms)
- [Optional Diagram (Mermaid)](#optional-diagram-mermaid)
- [How to Run the Simulation](#how-to-run-the-simulation)
- [Simulation Outcomes](#simulation-outcomes)
- [Repository Structure](#repository-structure)
- [Prerequisites](#prerequisites)
- [Notes](#notes)
- [License](#license)

---

## Project Overview

The primary goal is to model and simulate two interconnected systems:

1. **Complete EV Drivetrain** – Simulate vehicle motion based on a standard drive cycle.  
2. **Intelligent Thermal Management System** – Keep the Li-ion battery pack within **20–40 °C** for safety, longevity, and performance.

---

## Technology Stack

- **Simulation Environment:** MATLAB **R2023b** (or newer)  
- **Modeling:** Simulink  
- **Physical System Modeling:** **Simscape™** & **Simscape Fluids™**

---

## Key Features

### 1) Electric Vehicle Drivetrain Model

- **Longitudinal Driver:** PI controller that follows the **FTP75** drive cycle by generating acceleration and braking commands.  
- **Power Control Unit:** **H-Bridge inverter** controlled by a PWM generator to manage motor power.  
- **Regenerative Braking:** Logic that reverses power flow during deceleration to recharge the battery and improve efficiency.  
- **Detailed Battery Pack:** Li-ion model that tracks **State-of-Charge (SOC)** and **heat generation** based on current draw.

### 2) Battery Thermal Management System (BTMS)

- **Liquid Cooling Loop:** Simscape Fluids model of a closed-loop coolant circuit through the battery’s cooling plate.  
- **Intelligent Multi-Path Circuit:** Custom heating/cooling unit using a **4-way valve** to select the most energy-efficient thermal path.  
- **Three Heat Exchangers (HXs):**
  - **Radiator:** Rejects heat to ambient air under normal conditions.  
  - **Heater:** Warms coolant in cold weather to prevent battery performance degradation.  
  - **2-Phase HX (Chiller):** Aggressive cooling during fast charging or extreme heat, integrated with A/C.

---

## Diagram

GitHub renders the flow below if Mermaid is enabled.

```mermaid
flowchart LR
  Driver["Longitudinal Driver (PI, FTP75)"] --> PCU["Power Control Unit (PWM + H-Bridge)"]
  PCU --> Motor["Traction Motor"]
  Motor -->|Torque| Vehicle["Vehicle Dynamics"]
  Battery["Li-Ion Pack (SOC, Heat Gen)"] --> PCU
  Battery <-->|Heat| Plate["Cooling Plate"]
  Plate --> Loop["Coolant Loop"]
  Loop --> Valve["4-Way Valve"]
  Valve --> Radiator["HX1: Radiator"]
  Valve --> Heater["HX2: Heater"]
  Valve --> Chiller["HX3: 2-Phase HX (Chiller)"]
  Chiller --> AC["A/C System"]
  Radiator --> Loop
  Heater --> Loop
  AC --> Chiller
  Loop --> Plate
