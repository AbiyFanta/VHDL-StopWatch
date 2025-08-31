# VHDL-StopWatch

A digital stopwatch with start, stop, and reset functionalities, mirroring a real-world stopwatch.

## Components

* `clkdiv`: provides a 1/4 ratio clock signal.
* `FSM`: a finite state machine that enables and disables the counting mechanism.
* `Watch`: The main module that counts up and displays the three clock digits.

## Features

* Outputs a time value.
* Includes `start`, `stop`, and `reset` functions.