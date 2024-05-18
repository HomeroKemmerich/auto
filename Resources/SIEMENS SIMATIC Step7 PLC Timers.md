| English  
mnenonics | German  
mnenonics | Timer | Name | Diagram |
| --- | --- | --- | --- | --- |
| **SD** | **SE** | S\_ODT | On-Delay Timer | ![SD On-Delay Timer](https://plc.mavjuz.com/siemens/simatic/step-7/timer/sd.gif) |
| **SF** | **SA** | S\_OFFDT | Off-Delay Timer | ![SF Off-Delay Timer](https://plc.mavjuz.com/siemens/simatic/step-7/timer/sf.gif) |
| **SP** | **SI** | S\_PULSE | Pulse Timer | ![SP Pulse Timer](https://plc.mavjuz.com/siemens/simatic/step-7/timer/sp.gif) |
| **SE** | **SV** | S\_PEXT | Extended Pulse Timer | ![SE Extended Pulse Timer](https://plc.mavjuz.com/siemens/simatic/step-7/timer/se.gif) |
| **SS** | **SS** | S\_ODTS | Retentive On-Delay Timer | ![SS Retentive On-Delay Timer](https://plc.mavjuz.com/siemens/simatic/step-7/timer/ss.gif) |
| FR | FR |   | Enable Timer (Free) |   |
| R | R |   | Reset Timer |   |
| L | L |   | Load Current Timer Value  
into ACCU 1 as Integer |   |
| LC | LC |   | Load Current Timer Value  
into ACCU 1 as BCD |   |

## Step7 Timer example for STL (AWL)

<table><tbody><tr><td data-evernote-id="64"><pre data-evernote-id="117">// Example STL Timer - English syntax

AI 0.0// Test input bit 0.0
LS5T#10s// Preset 10 seconds into ACCU 1.
SDT1// Start On-Delay Timer

AT1// Check signal state of timer T1.
=Q 4.0// Make output bit 4.0</pre></td><td data-evernote-id="65"><pre data-evernote-id="118">// German syntax

UE 0.0
LS5T#10s
SET1

UT1
=A 4.0</pre></td></tr></tbody></table>

## Time Value — Human-readable time format

**S5T#**<hours>**H** <minutes>**M** <seconds>**S** <milliseconds>**MS**

• Minimum value: **S5T#10MS**

• Maximum value: **S5T#2H46M30S**

```
// Example - Human-readable time constants

LS5T#10MS// 10 ms (timebase = 10 ms)
LS5T#5S// 5 s (timebase = 10 ms)
LS5T#1M20S// 1 m, 20 s (timebase = 100 ms)
LS5T#5M30S// 5 m, 30 s (timebase = 1 s)
LS5T#1H40M// 1 h, 40 m (timebase = 10 s)
```

## Time Value — Native time format

**W#16#**<resolution\> <BCD\>

• <Resolution> (1 decimal code number)

| Code | Resolution or  
Time Base | Range of Time value |
| --- | --- | --- |
| min | max |
| **0** | 0.01 s (10 ms) | 10 ms | 9s 990ms |
| **1** | 0.1 s (100 ms) | 100 ms | 1m 39s 900ms |
| **2** | 1 s | 1 s | 16m 39 s |
| **3** | 10 s | 10 s | 2h 46m 30s |

• <BCD> integer (3 decimal digits)

Integer from **001** to **999**.

```
// Step 7 Example - Native time constants

// Resolution = 10 ms, range = [10ms; 9s990ms]
LW#16#0001// 10 ms
LW#16#0002// 20 ms
LW#16#0500// 5 s (5000 ms)
LW#16#0999// 9 s, 990 ms

// Resolution = 100 ms, range = [100ms; 1m39s900ms]
LW#16#1001// 100 ms
LW#16#1002// 200 ms
LW#16#1010// 1 s (1000 ms)
LW#16#1050// 5 s (5000 ms)
LW#16#1999// 1 m, 39 s, 900 ms (99900 ms)

// Resolution = 1 s, range = [1s; 16m39s]
LW#16#2001// 1 s
LW#16#2002// 2 s
LW#16#2005// 5 s
LW#16#2060// 1 m (60 s)
LW#16#2999// 16 m, 39 s (999 s)

// Resolution = 10 s, range = [10s; 2h46m30s]
LW#16#3001// 10 s
LW#16#3002// 20 s
LW#16#3006// 1 m (60 s)
LW#16#3030// 5 m (300 s)
LW#16#3360// 1 h (3600 s)
LW#16#3999// 2 h, 46 m, 30 s (9990 s)
```