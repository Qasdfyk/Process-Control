# Control Systems Projects - Process Control and Optimization

This repository includes two advanced projects in process control. These projects cover various control methods, dynamic system modeling, and simulation using MATLAB and Simulink.

## Project 1: Dynamic System with State Feedback and Observer Design

### Objective
To analyze and control a dynamic system characterized by a continuous transfer function, using state-space representation, state feedback control, and full-order observer design.

### Tasks
1. **State-Space Representation**:
   - Converted the system’s transfer function to state-space form.
   - Verified back-conversion from state-space to transfer function to ensure consistency.

2. **State Feedback Control**:
   - Implemented state feedback control using Simulink.
   - Simulated system response for various closed-loop pole configurations (slow, medium, fast) and identified optimal pole placements.

3. **Full-Order Observer Design**:
   - Designed and simulated a full-order observer with various observer poles.
   - Compared real and estimated states with both zero and non-zero initial conditions.

4. **Controller Testing**:
   - Simulated controller performance with and without direct state measurement, using state estimates from the observer.

5. **Advanced Controller with Integral Action** (Bonus):
   - Designed an extended state feedback controller with integral action.
   - Evaluated performance for both slow and fast closed-loop poles.

### Tools
- MATLAB for calculations and Simulink for system modeling and simulations.

---

## Project 2: PID, DMC, and GPC Controllers for Discrete Systems

### Objective
To design, implement, and compare various control algorithms, including PID, Dynamic Matrix Control (DMC), and Generalized Predictive Control (GPC), for a discrete system represented by a transfer function.

### Tasks
1. **Discrete Transfer Function and Difference Equation**:
   - Derived the discrete transfer function and its corresponding difference equation.
   
2. **PID Controller**:
   - Implemented a PID controller using the Ziegler-Nichols tuning method.
   - Simulated continuous and digital PID responses, noting effects on system output and control signal.

3. **DMC Algorithm**:
   - Designed a DMC controller in MATLAB, adjusting prediction and control horizons for optimal response.
   - Analyzed DMC performance based on control quality, setpoint tracking, and stability under parameter variations.

4. **GPC Algorithm**:
   - Implemented a GPC controller and compared its performance to DMC, focusing on handling disturbances and prediction capabilities.
   - Conducted stability region analysis for the DMC and GPC controllers under gain variations.

5. **Comparison of DMC and GPC**:
   - Compared the stability, responsiveness, and disturbance rejection of the DMC and GPC algorithms, highlighting the strengths of each approach for different control scenarios.

### Tools
- MATLAB for all simulations and code implementations.

---

## Repository Contents
- **/Project1**: Files and scripts for state-space modeling, state feedback, and observer design.
- **/Project2**: MATLAB code for PID, DMC, and GPC controllers, including stability analysis and comparative results.

---

## Usage
Clone the repository and navigate to each project folder. Each folder contains MATLAB scripts and Simulink models. For Project 2, adjust algorithm parameters in the MATLAB scripts to explore different controller behaviors.

---

## License
This project is for educational purposes. Refer to the institution's guidelines for any restrictions on sharing or distribution.
