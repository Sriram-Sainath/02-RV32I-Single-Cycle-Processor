# Adder

## Overview

The Adder module performs arithmetic addition operations within the RV32I Single-Cycle Processor. It is used to compute addresses and update the Program Counter (PC) during instruction execution.

## Function

The Adder is responsible for:

- Adding the current Program Counter (PC) with 4 to obtain the next sequential instruction address.
- Calculating branch target addresses.
- Performing address calculations required by the processor datapath.

## Inputs

| Signal | Width | Description |
|--------|------:|-------------|
| A | 32-bit | First operand |
| B | 32-bit | Second operand |

## Outputs

| Signal | Width | Description |
|--------|------:|-------------|
| SUM | 32-bit | Result of A + B |

## Features

- 32-bit combinational adder
- Zero-latency arithmetic operation
- Used for PC increment and address generation
- Synthesizable Verilog implementation

## Source File

- `Adder.v`

## Role in Processor

The Adder is a fundamental component of the processor datapath and is used in multiple locations, including:

- Program Counter (PC + 4)
- Branch address computation
- Jump target calculation
- Address generation for memory operations

## Author

Sriram Sainath