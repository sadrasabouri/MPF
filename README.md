# MPF
Micro-Professor MPF for 8051 Instruction Set

Micro-Professor is a system wich can simulate any assembly (`8051` in this case) code on it's RAM which is inputted as Opcodes and Operands -in HexDecimal mode- before execution.
It has a funny name which comes from combination of Micro-Processor and Professor which means it can be as a Professor (which may know all the instruction set) that run your code in its head and show it's answer to you.

Main challeng is the fact that executing these instructions is normally done inside the `8051` by hardware dedicated to each `Fetch`, `Execute` and `Run` cycle and here we should simulate them by a software program using 8051 insturctions.

<img src="https://github.com/sadrasabouri/MPF/blob/main/Others/MAIN_CIRCUIT.PNG">

## Developers

* **Mohammad Qumi** [Mohammad Qumi](https://github.com/Mohammad-Qumi)
* **Sadra Sabouri** [Sadra Sabouri](https://github.com/sadrasabouri)
* **Mohammad Sina Hassan Nia** [Mohammad Sina Hassan Nia](https://github.com/sinahsnn)

##  How to Use

Fallowing steps may be taken for starting simulation the desired code:

1.  Press `PC` key. (Any other key will be ignored)

2.  Enter two Hex number dedicating RAM address, after this step RAM address will be shown on 7-segments for a while. (Any other key except keys from `0` - `F` will be igonred)

3.  Press `EXE` key. (Any other key will be igonred)

4.  Enter two Hex number dedicating OpCode of instruction, after this data will be shown on 7-segments for a while. (Any other key except keys from `0` - `F` will be igonred)

5.  Press `EXE` key. (Any other key will be igonred)

6.  For selecting next home of RAM you can easily press:
+   `+` for going forward on RAM
+   `-` for coming backward on RAM
After this situation you don't have to press `EXE` again, just input your desired data and then press `EXE`. You can end this process anytime you want by simply pressing `END` key.
You should put an `00` at the end of your code which makes it easier for simulator to find where should it stop.

7.  After pressing `END` a number will be shown on 7-segment which is the result of calculations, it'll show `88` if there is somthing wrong with at least a OpCode.

<b> After this process whole system may need a reset </b>

## Technical Detail


