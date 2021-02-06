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

Fallowing steps may be needed for starting a simulation on the desired code:

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

For saving states and assigning a transition function between them corresponding to each input key, we can have a DFA(FSM - Finite State Machine) which describes these transitions.

Fallowing Registors are specific registors on code:

| Registor | Use |
|:-------:|:-------:|
| R0 | State index (Values in circles in fallowing FSM) |
| R1 | Inputted key value (Values on edges in fallowing FSM) |
| R2 | Address Buffer (Containing last inputted address of RAM) |
| R3 | Data Buffer (Containing last inputted address to be saved on RAM)

<img src="https://github.com/sadrasabouri/MPF/blob/main/Others/Working_FSM.png">

`R0` Registor - which is filled by situation index - might get some values which is described case by case in fallowing table:

| Value | Situation |
|:-------:|:-------:|
| `00H` | Wait for user to push `PC` |
| `01H` | Wait for user to enter higher part of start address |
| `02H` | Wait for user to enter lower part of start address |
| `03H` | The address is entered and the user should enter `EXE` |
| `04H` | Address is sent to controller and now it's time to enter higher part of data which you want to send to that memory address |
| `05H` | Address is sent to controller and now it's time to enter Lower part of data which you want to send to that memory address |
| `06H` | Data is sent to choosen memory address and user must click on `EXE` |
| `07H` | Wait for user to enter higher part of the next address |
| `08H` | Wait for user to enter lower part of the next address |


`R1` Registor - which is filled by inputted key value - might get some values which is described case by case in fallowing table:

| Value | Corresponding Key |
|:-------:|:-------:|
| `00H` - `0FH` | `0` to `F` keys on keypad |
| `10H` | `PC` |
| `20H` | `F1` |
| `30H` | `ADR` |
| `40H` | `F2` |
| `50H` | `+` |
| `60H` | `F3` |
| `70H` | `-` |
| `80H` | `F4` |
| `90H` | `DATA` |
| `A0H` | `F5` |
| `B0H` | `MOD` |
| `C0H` | `F6` |
| `D0H` | `EXE` |
| `E0H` | `F7` |
| `F0H` | `END` |
| `F1H` | `F8` |

## Supported Instructions

Fallowing 8051 instrucrions are now guaranteed to be worked well:
 
+   `MOV`

+   `CALL`

+   `AJUMP`

+   `RET`

+   `ADD`

+   `ADDC`

+   `SUB`

+   `INC`

+   `DEC`
