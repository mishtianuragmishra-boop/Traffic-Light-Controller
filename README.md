#  Traffic Light Controller using Verilog HDL

A simple **Traffic Light Controller** designed in **Verilog HDL** using a **Finite State Machine (FSM)**. The controller cycles through **Red → Green → Yellow → Red** with configurable timing delays and includes a testbench for simulation and waveform verification.

---

##  Project Overview

This project demonstrates the implementation of a basic traffic light controller using sequential logic in Verilog. A counter is used to control the duration of each traffic light state, while an FSM manages the transitions between them.

The design was verified through simulation using a dedicated testbench and waveform generation.

---

## Features

*  Three traffic light states

  * Red
  * Yellow
  * Green
*  Finite State Machine (FSM)
*  Counter-based timing control
*  Verilog testbench for verification
*  Waveform generation using VCD files
*  Compatible with ModelSim, Icarus Verilog, and GTKWave

---

##  Project Structure

```text
Traffic-Light-Controller/
│
├── traffic_light.v          // Main traffic light controller
├── traffic_light_tb.v       // Testbench
├── traffic_light_output.png // Simulation waveform
├── README.md
└── LICENSE
```

---

##  State Diagram

```text
          +---------+
          |  GREEN  |
          +---------+
               |
               v
          +---------+
          | YELLOW  |
          +---------+
               |
               v
          +---------+
          |   RED   |
          +---------+
               |
               └──────────────► GREEN
```

---

## ⏱️ State Timing

| State     |  Duration |
| --------- | --------: |
| 🟢 Green  | 30 Counts |
| 🟡 Yellow | 10 Counts |
| 🔴 Red    | 40 Counts |

---

##  Simulation

The testbench performs the following operations:

* Generates the system clock
* Applies a reset signal
* Instantiates the traffic light controller
* Displays signal transitions using `$monitor`
* Generates a **traffic.vcd** waveform file using:

  * `$dumpfile`
  * `$dumpvars`

---

##  Simulation Output


Example:

```text
Traffic Light Test

Time 0 : red=1 yellow=0 green=0
Time 3 : red=0 yellow=0 green=1
Time 65: red=0 yellow=1 green=0
Time 87: red=1 yellow=0 green=0
```

---

## Tools Used

* Verilog HDL
* ModelSim / Icarus Verilog
* GTKWave (Waveform Viewer)

---

## What I Learned

* Designing a Finite State Machine (FSM) in Verilog
* Implementing sequential logic using clocked `always` blocks
* Using counters to create timing delays
* Separating combinational and sequential logic
* Writing a Verilog testbench
* Generating and analyzing simulation waveforms

---

## License

This project is licensed under the MIT License.
