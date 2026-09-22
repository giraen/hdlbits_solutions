# HDLBits Problem Set Solutions
In this repository, the solutions for the problem sets from [HDLBits](https://hdlbits.01xz.net/wiki/Main_Page). 
HDLBits is a website used to practice your understanding with verilog and implement known digital circuits using it.

## Software
Below are the software I used.
1. [Icarus Verilog](https://github.com/steveicarus/iverilog)
2. [GTKWave](https://github.com/gtkwave/gtkwave)

## Installation
This installation was based on my environment, which is using Windows and already have an MSYS2.
1. Install Icarus Verilog and GTKWave by running the command,
```bash
pacman -S mingw-w64-ucrt-x86_64-iverilog
pacman -S mingw-w64-ucrt-x86_64-gtkwave
```
2. Verify the installation is success.
```bash
iverilog -V
vvp -V
gtkwave --version
```

## Workflow
1. Create a module describing the circuit.
2. Create a testbench that will test different combination for its inputs.
3. Compile your testbench file with Icarus Verilog using the command,
```bash
iverilog -o <target file name.vvp> <source file name.v>

# Example
iverilog -o test_tb.vvp test_tb.v
```
4. Simulate it with VVP. 
```bash
vvp <file name.vvp>

# Example
vvp test_tb.vvp
```
5. Run the output file using GTKWave to see the output waveform.
```bash
gtkwave <file name.vcd>

# Example
gtkwave test_tb.vcd
```