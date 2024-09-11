## 1)
### a)

![[Digital kredsløb exercise 5.1.a.excalidraw]]

### b)
![[Digital kredsløb exercise 5.1.b.excalidraw]]

### c)
![[Digital kredsløb exercise 5.1.c.excalidraw]]

## 2)
### a)
![[Pasted image 20231117091435.png]]

| Present State | Next State | Output |
| ------------- | ---------- | ------ |
| a             | f / b      | 0 / 0  |
| b             | d / a      | 0 / 0  |
| d             | g / a      | 1 / 0  |
| f             | f / b      | 1 / 1  |
| g             | g / d      | 0 / 1  |

### b)
![[Digital kredsløb exercise 5.2.b.excalidraw]]

### c)
Input sequence from state a:
01110010011

Output sequence:
01000111010

## 3)
### a)
| x_in |     | A(t) | B(t) |     | A(t+1) / D_A | B(t+1) / D_B |     | Order |
| ---- | --- | ---- | ---- | --- | ------------ | ------------ | --- | ----- |
| 0    |     | 0    | 0    |     | 0            | 0            |     | same  |
| 0    |     | 0    | 1    |     | 0            | 1            |     | same  |
| 0    |     | 1    | 0    |     | 1            | 0            |     | same  |
| 0    |     | 1    | 1    |     | 1            | 1            |     | same  |
| 1    |     | 0    | 0    |     | 0            | 1            |     | to 01 |
| 1    |     | 0    | 1    |     | 1            | 1            |     | to 11 |
| 1    |     | 1    | 0    |     | 0            | 0            |     | to 00 |
| 1    |     | 1    | 1    |     | 1            | 0            |     | to 10 |  

![[Digital Kredsløb exercise 5.3.a]]

### b)
| x_in |     | A(t) | B(t) |     | A(t+1) / D_A | B(t+1) / D_B |     | Order |
| ---- | --- | ---- | ---- | --- | ------------ | ------------ | --- | ----- |
| 0    |     | 0    | 0    |     | 0            | 0            |     | same  |
| 0    |     | 0    | 1    |     | 0            | 1            |     | same  |
| 0    |     | 1    | 0    |     | 1            | 0            |     | same  |
| 0    |     | 1    | 1    |     | 1            | 1            |     | same  |
| 1    |     | 0    | 0    |     | 1            | 1            |     | to 11 |
| 1    |     | 0    | 1    |     | 1            | 0            |     | to 10 |
| 1    |     | 1    | 0    |     | 0            | 0            |     | to 00 |
| 1    |     | 1    | 1    |     | 0            | 1            |     | to 01 |

![[Digital Kredsløb exercise 5.3.b]]

