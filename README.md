# Traffic Light Controller using FSM – Verilog HDL

## Overview

This project implements a traffic light controller using a Moore Finite State Machine (FSM) in Verilog HDL. The controller manages traffic flow at a junction by controlling North-South and East-West signals.

## Features

* Moore FSM-based design
* Four states representing traffic light conditions
* Automatic state transitions using clock and counter
* Synchronous reset

## States

| State | NS Light | EW Light |
| ----- | -------- | -------- |
| S0    | Green    | Red      |
| S1    | Yellow   | Red      |
| S2    | Red      | Green    |
| S3    | Red      | Yellow   |

## Design Details

* Implemented using `always @(posedge clk or posedge reset)`
* State transitions follow a cyclic sequence
* Output depends only on current state (Moore FSM)

## Simulation

* Testbench written in Verilog
* Simulated using ModelSim
* Verified using waveform outputs

## Files

* `traffic_light.v` : Main FSM design
* `traffic_tb.v`    : Testbench

## Future Improvements

* Add real-time delays (different timing for green/yellow)
* Add emergency vehicle priority
* Extend to full 4-road intersection

## Author

Vinay Mallipamu
