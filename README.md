# PWM Motor Control in Verilog

This project implements a parameterized PWM generator suitable for motor control.
It was designed for FPGA targets (tested on Artix-7 Basys-3 board).

## Features
- Adjustable duty cycle (0-255)
- Parameterized clock and PWM frequency
- Clean RTL design + testbench

## Files
- src/pwm.v        → RTL PWM module
- tb/pwm_tb.v      → Testbench with waveform dumps

## Simulation
Generated VCD waveforms via Icarus Verilog:
  iverilog -o pwm_tb tb/pwm_tb.v src/pwm.v
  vvp pwm_tb
  gtkwave pwm_tb.vcd

## Hardware Notes
On FPGA, connect pwm_out to oscilloscope or LED for verification.
