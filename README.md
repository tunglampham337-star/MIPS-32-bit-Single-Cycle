# MIPS 32-bit Single-Cycle Processor in Verilog

## Project Overview
This repository contains the design and verification of a 32-bit Single-Cycle MIPS processor implemented in Verilog HDL. The processor architecture is based on a reduced MIPS instruction set and integrates essential functional blocks: Arithmetic Logic Unit (ALU), Register File, Control Unit, Instruction Memory, and Data Memory.

## Instruction Formats
The system supports three fundamental MIPS instruction formats: R-type, I-type, and J-type.

![MIPS Instruction Formats](image_fde792.png)

Supported instruction set:
*   **R-Type (Register arithmetic and logic operations):** `add`, `sub`, `and`, `or`, `slt`
*   **I-Type (Immediate and memory access operations):** `addi`, `lw`, `sw`, `beq`
*   **J-Type (Unconditional jump):** `j`

## Datapath and Control Unit
The schematic below illustrates the complete datapath and the associated control signals realized in the Verilog implementation:

![MIPS Datapath](image_fde78e.jpg)

## Test Programs and Algorithms
To verify the hardware logic, specific arithmetic algorithms were converted into MIPS machine code and loaded into the Instruction Memory for execution.

### 1. Even/Odd Checker
This program determines whether a given integer `n` (stored in register `$t0`) is even or odd by executing a bitwise `AND` operation with 1. The result updates the state of specific registers:
*   `$s2 = 1` if `n` is an even number.
*   `$s1 = 1` if `n` is an odd number.

![Even/Odd Checker Flowchart](image_fdea91.png)

### 2. Prime Number Checker
This program verifies whether an integer is a prime number using iterative divisibility checks. Since the implemented MIPS architecture lacks a dedicated hardware division (`div`) instruction, the modulo operation is simulated via successive subtraction loops. 
The boolean outcome is output to register `$s0`:
*   `$s0 = 1`: The number `n` is prime.
*   `$s0 = 0`: The number `n` is not prime.

![Prime Number Checker Flowchart](image_fdea94.png)

## Simulation Results
The following waveform captures validate the correct execution of instructions during the testbench simulation. Key signals observed include the Program Counter (`pcout`), branch control signals, and the output registers (`$s0`, `even`, `odd`).

**Even/Odd Checker Simulation:**
![Waveform 1](image_fdea97.png)
![Waveform 2](image_fdeaaf.png)

**Prime Number Checker Simulation:**
![Waveform 3](image_fdeab2.png)
![Waveform 4](image_fdeab5.png)

## Simulation Instructions
1. Clone this repository to your local environment.
2. Import the project directory into a hardware simulation tool such as ModelSim, Vivado, or Quartus.
3. Compile all Verilog source files (`*.v`).
4. Execute the simulation using the `testbench.v` module as the top level.
5. Add the necessary signals to the waveform viewer to analyze and verify the processor's behavior against the reference results provided above.
