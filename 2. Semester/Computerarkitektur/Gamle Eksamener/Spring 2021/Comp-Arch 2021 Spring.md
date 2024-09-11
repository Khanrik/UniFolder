## SECTION 01 - BASICS, REPRESENTING AND MANIPULATING INFORMATION
### List all 5 basic logic gates and give the condition when the output is 1.
The 5 basic logic gates are AND, OR, NOT, XOR, and NAND. The condition for each is as follows:
* AND: (1,1)
* OR: (0,1), (1,0), (1,1)
* NOT: (0)
* XOR: (0,1), (1,0)
* NAND: (0,0), (0,1), (1,0)

### How do you calculate the number of bits needed to represent a positive integer?
You can calculate the minimal number of bits needed as log₂(n)+1, where n is the desired integer (for unsigned). If the result of the calculation is a decimal number it has to be floored. If the integer is signed instead it should be +2.

### How are negative integers represented in binary? Show it with 3 bits in the table below! Generally, how is the representable range different between signed and unsigned for a given length?
| Bit pattern    | 000 | 001 | 010 | 011 | 100 | 101 | 110 | 111 |
| -------------- | --- | --- | --- | --- | --- | --- | --- | --- |
| Unsigned value | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   |
| Signed value   | 0   | 1   | 2   | 3   | -4  | -3  | -2  | -1  |

Negative integers are with signed values. This means that the MSB is negative instead of positive, while the rest are still positive. The representable range in the positive integer range goes from $2^{n}$ to $2^{n-1}$ when using signed values. But in the negative range it goes from not being able to represent them to being able to represent them down to $2^{n}$.

### What is overflow and which operations are vulnerable to it?
Overflow occurs when a number goes above the maximal representable positive value or below the minimal representable negative value. Arithmetic operations that can increase or decrease the value by a set amount, such as addition, can cause this to happen.

### Briefly describe the ADD operation for two signed integers!
When adding two signed integers you add the bits from each integer with the corresponding bits in the other integer, so the bit representing $2^{0}$ is added with the other bit representing $2^{0}$ and so on. You do this all the way while remembering to add carry bits along the way. If you add two positive integer, but the MSB becomes 1 after adding you add an extra 0 as the new MSB.

### Briefly describe the ADD operation for a signed and an unsigned integer!
As to not lose any information the unsigned integer can be converted to a signed integer by adding a 0 as the new MSB. The addition can then be done as normal signed addition.

### How do compilers speed up multiplications?
The compiler can multiply by $2^{n}$ by bitshifting the value $n$ spaces to the left. If it is not multiplied by a power of 2 it can be multiplied by the closest power of 2 and then the rest can be added as usual.

### What is the “word size” of a computer? What are the typical values?
The word size is the amount of bits each register in a computer can hold. In modern computers computers usually run on 64-bit systems, but not long ago 32-bit was also common.

### What is “big endian” and “little endian” byte ordering and what’s the difference?
The big and little endian byte ordering is a convention to stores values in memory. Big endian is where the largest byte is stores in the first memory address (lowest address) and the smallest byte is stored in the last memory address (highest address). Little endian is then the opposite.

### Briefly describe how fractional numbers are represented in binary. What is the decimal value of 1010.001?
The numbers before the radix point is represented in the same way as with integers where the bits represents 2⁰ , 2¹ , ... , but the numbers after the radix point represent 2⁻¹ , 2⁻², ... . The decimal value of 1010.001₂ is 10.125₁₀.

### Briefly describe how the IEEE Floating Point standard represents fractional numbers! (SKRIV SENERE)
A value, $v$, can be numerically written in the IEEE Standard 754 as $v=(-1)^{s} M 2^{E}$, where s is the sign bit, M is significand, and E is the exponent. 
When writing the number in 32-bit format, 1 bit is used for the sign bit, 8-bits are used to encode E to exp, and 23-bits are used to encode M to frac.
Furthermore a bias is defined as $2^{8-1}-1=127$.

M is found by converting $v$ to binary and then moving the radix point to right after the most significant 1. The value of frac will then be the fractional part of M. E is defined as the number of spaces the radix point had to be moved. The value of exp is then found as the difference between the bias and E. you then write out the floating point in the order of s, then exp, then frac. If frac does not require 23-bits the latter bits are filled out with 0.

### Why is it impossible for any finite size floating point standard to represent arbitrary fractional values precisely?
Since the floating point standard is made with base-2 there are values that are not representable since they would require infinitely writing out a recurring sequence of numbers. This also happens in base-10 decimals such as the value $\frac{1}{3}$, which cannot be written out with a finite amount of decimals.

### As we go further from zero, how does the distribution of representable numbers change when using the IEEE floating point standard? Why?
The distribution of representable numbers become less dense. This happens since you move further away from 0, which means that you need more values to represent integer values instead of fractional values. With less fractional values you can then represent less values between the integers, so the distribution density falls exponentially with the loss of fractional numbers.

### What are the rounding modes of IEEE floating point numbers? Give the rounded value of 2.5 with each mode!
There are 4 rounding modes: towards zero, round down, round up, and nearest even. For each mode 2.5 would be rounded as such:
* Towards zero: 2
* Round down: 2
* Round up: 3
* Nearest even: 2



## SECTION 02 - MACHINE LEVEL PROGRAMMING
### What is the difference between Instruction Set Architecture and Microarchitecture? Give an example of each.
Instruction Set Architecture (ISA) is the abstracted version of a processors Microarchitecture. This means that the ISA has instructions that the programmer will refer to such as jump, read, load, and arithmetic operations, while the Microarchitecture is the implementation. An example of an ISA is x86 assembly which is supported by processors such as Intel's I series or AMD's Ryzen series. Another example is Apples M series chips, which has a Microarchitecture that does not support the same ISA but has its own assembly version since it is based on the ARM architecture.

### What is the difference between machine code and assembly?
Machine code is the language that the processor can run, in other words the language that the microarchitecture is written in. Assembly is then the human readable interface that programmers write code in. The assembly code can then be assembled to machine code, which the machine can execute.

### Briefly describe what steps are necessary to turn C source code to an executable program.
The C source code is compiled into and assembly file, which can then be assembled into an object- or binary-file. This file holds the machine code which can be linked with code or libraries into an executable program.

### What is the main difference between the -O1, -O2, -O3 and -Os optimization flags of gcc?
-O1 makes the compiler reduce the code size and execution time, without increasing compilation time. It leads to the fastest compilation time but slowest performance.
-O2 makes the compiler use all optimization options that do not increase the size of the file too much. Making it perform better but with a slightly larger code size.
-O3 makes the compiler use all optimization options. It therefore results in the best performance but with the largest code size
-Os does the same as -O2, but with a bias towards space efficiency, so it cuts off even more optimization options to minimize code size.

### What data types and operations are available in assembly?
The available data types are:
* Integers of 1, 2, 4, or 8 bytes, which are used for both values and addresses.
* Floating point numbers of 4, 8, or 10 bytes.
* Byte sequences, which holds machine code instructions.

The available operations are:
* Arithmetic functions
* Data transfer operations such as MOV
* Control transfer operations such as JMP

### What is the role of number 8 in the following memory addressing mode and what is it generally used for? 
```asm
movq 8(%rbp),%rdx
```
8 is the constant that the register %rbp is displaced by. It can be used to access datatypes in sequence. In this case it would work for an array of elements with a size of 8 bytes.

### How does the compiler compile a switch expression and why is it better than a sequence of if-else? What are limitations of using switch, from the programmer’s perspective? (SE VIDEOEN IGEN IGEN IGEN!!!!)
A switch expression is compiled as a single comparison and an thereafter a 

### What is the stack, and where does the stack pointer %rsp point to? What do the push and pop instructions do?
The stack is a region of memory that follows the last in first out discipline. This means that the latest element inserted onto the stack is always taken out first. %rsp then points to the "top" of the stack, which holds the latest inserted element. The push function inserts a new element on top of the stack, and pop removes the top element of the stack.

### Briefly describe how the stack is used when a function calls another function, which returns data to the caller.
When a function is called it is pushed onto the stack. If it then calls another function, that nested function is further pushed on top. When the nested function is done it is pushed and the original function is again the top element and is also popped when it is done executing.

### Why does it take a little more time to call a function with 9 parameters than with 5?
A function has to push its parameters onto the stack as part of its execution. When it pushes 9 instead of 5 elements it requires a bit more space and time.

### Briefly describe what a stack frame is and list at least 3 components of a Linux stack frame!
When a function is called and pushed to the stack all its arguments as well as return address has to be pushed as well. They can't all be on top of the stack so the a frame pointer can mark the start of the function to keep the function grouped. The entire function region is called a stack frame. Components of the stack frame could then be the return address, the input parameters, and the local variables of the function.

### How are C arrays laid out in the memory? How many bytes are allocated when you write int arr\[13];? Why is arr\[i] equivalent to \*arr+i?
Arrays are laid out as elements in succession as well as a pointer pointing to the first element. In this case $13 \cdot 4$ bytes are allocated for the elements (assuming integers are of 4 bytes) and an additional 8 bytes for the pointer. When addressing elements it is known that the pointer points at the first one, when adding the index it therefore simply goes to the next element in succession making arr\[i] equivalent to \*arr+i.

### What does it mean that C stores multidimensional arrays in a row-major order?
Normally elements in arrays are stored in succession, when arrays are nested it has to be established what "in succession" means. Row-major order means that it goes from elements A\[0]\[0] to A\[0]\[c-1] first and then goes to A\[1]\[1] to A\[0]\[c-1] and so on.

### How is a C structure represented in memory? What are the best practices when declaring a structure, and why? What is alignment and how does it change the memory allocated for a structure?
A struct is represented as a big block of memory that holds all of the different types in succession. The best practice is to put the data in size order with the largest first. This is better since the structure can have a greater size after alignment if it is not done. Alignment is when the elements are padded in such a way that every piece of data fits into a chunk of $k$ bytes, where $k$ is usually 2 or 4. This makes addressing easier. This means that structures not following the best practice utilizes a lot of padding when it didn't have to.

### What are XMM registers and what are they used for?
XMM registers are 128 bit registers that can hold integer or floats. They can only be used to arithmetic calculations on data and can not hold addresses.

### Briefly describe the Single Instruction Multiple Data (SIMD) technique and what it’s good for! What kind of registers are used with SIMD instructions?
The SIMD technique or SIMD parallelism is a way to perform multiple operations with a single instruction by doing it in parallel. This is done to speed up applications. XMM registers are usually used with the instructions since they contain a lot of storage for integers and floats, which is also what SIMD instructions mainly perform operations on.

### What is an exceptional control flow? Briefly describe it and give at least 3 examples.
An exceptional control flow is when the program is capable of having transfer of control to the OS kernel in response to an event. At a low level it can happen if there is a change in the system state such as the memory corrupting. Other exceptions could also be the user interrupting the program or the program making nonlocal jumps.

### What is the difference between synchronous and asynchronous exceptions? Give at least two examples of both.
Synchronous exceptions happens after executing an instruction, while asynchronous exceptions are caused by things external to the processor. Example of synchronous exceptions could be division by zero which aborts the program or system calls which temporarily gives control to the OS and then resumes the program. Asynchronous on the other hand could be user interrupts or the transfer of control to the OS that the processor makes every few MS, which is triggered by an external chip.

### What is a process, and what logical abstractions does it provide? Why are these abstractions important? How does the operating system identify the running processes?
A process is an instance of a program in execution. It provides abstraction for both logic control flow and private address space. It is important that each process thinks it has exclusive use of both the control flow and address space since it then can run freely and "independently", while the kernel makes sure nothing breaks. The kernel can then identify each process and its requirements in their respective context. 

### Briefly describe how a single core CPU runs multiple processes concurrently. Explain the concept of context switching, and the important design decisions about it.
A single core CPU can only run one process at a time, but it can switch between each process and its respective context. This process of switching is called context switching. Because of the switching, the CPU doesn't run one process at all times even when it is in use. It then has to be taken into account how much time it runs each process before switching when designing since too little time results in the process not running properly but too much time leads to breaking the illusion of parallel processing.

### What states can a process be in, and how does it transition between them?
From a programmer's perspective, processes can be in one of three states. 
* Running, where it is executing or is waiting for its turn to be switched back to by the kernel to again execute.
* Stopped, where it will not be switched back to and therefore is not executing anything until a change is made.
* Terminated, where the process is stopped permanently.
The CPU switches between these states upon receiving various signals from the kernel. 

### Why does the C fork() call return twice, and how do we know which branch we are in?
When fork() is called it creates a child process which will return once it has executed, but the parent process also has a return statement which will be executed. It therefore results in two returns. To know which branch we are in, the PID can be inspected. It should be 0 if it is the child process.

### What are the similarities and differences between the parent and child process after using fork()?
The child process gets a separate but identical copy of its parent's virtual address space and file descriptors. Furthermore, the child gets a different PID than the parent.

### What is a process graph?
A process graph is a tool to visualize the ordering of statements in a concurrent program. In the graph, vertices show execution of statements, arrows shows the order, edges can be labeled with variable values, and print vertices can be labeled with printing output.

### What is a zombie process, why is it bad and how is it handled?
A zombie process is a process that has been terminated but still consumes the system's ressources. This can be handled by the parent, since they can reap the child processes using wait or waitpid, making the kernel delete the zombie processes. If the parent does not reap the child, it can be reaped by the bootup init process.

### What is the fundamental issue with a server implemented as an iterative process? How do we solve it?
Iterative servers have the issue that they can only process one request/client at a time. This means that a single client can block the entire server from being used by anyone else if they connect to the server and forgets to disconnect. To solve this problem concurrent servers should be used instead.

### List and briefly describe 3 major problems that arise with concurrent programming
Concurrent programming is hard since:
* There are data races, where different processes may need the same datum, which means that their execution might change the other's outcome or block the other's access to executing their program.
* Deadlocks can occur, where one process waits for another process to execute, but that other process waits on a third circling back since it waits for the first process. This leads to none of the processes executing the program.
* Sometimes solutions to data races can lead to livelocks. If a process changes its state to not get in the way of another, but the other does the same and they end up in a loop, they will not be able to execute anything either.

### What are the 3 ways of writing concurrent programs? Briefly describe each!
Three approaches to writing concurrent program could be:
* A process-based approach, where the kernel does the context switching between the logical flows of different processes. Here each process will have its own private address space.
* An event-based approach, where the programmer makes sure each process runs on multiple logical flows with forks, but each process can share the same address space.
* A thread-based approach, where the kernel again controls the logical flows of each process, but the processes now share the same address space, meaning that they can share data.

### Give at least 2 advantages and 2 disadvantages of a process-based concurrent server implementation!
Process-based concurrent serves are the most simple and straightforward to handle and can utilize multicore processors.
Disadvantages of this approach is that it makes it harder to share data between processes, while also requiring additional overhead from the process control it runs more cores.

### Give at least 2 advantages and 2 disadvantages of an event-based concurrent server implementation!
Event-based concurrent serves allow for easier data transfer since there is a single address space. Furthermore, the programmer has more control of the control flow making it easier to control what happens.
However, having that much control how makes it harder to code, since the programmer has to do a lot more manually. It can not utilize multiple cores either since it runs on multiple threads but on the same core.

### Give at least 2 advantages and 2 disadvantages of a thread-based concurrent server implementation!
Thread-based concurrent servers allow for easier data transfer since there is a single address space. Running on threads also makes it more efficient than running in different processes, while the kernel can still do the allocation as opposed to how it's done in the event-based approach.
The sharing of data between threads can however lead to bugs and errors. It is also harder to code than the more straightforward process-based approach.

### What is a thread and how is it different than a process?
A thread, like a process, has its own logical control flow, where a context switch can transition between each thread. They can run concurrently but unlike processes they can also share code and data, since they share an address space. They are also less expensive to run, create, and reap than processes.

### When do we call two threads concurrent? When are they actually running at the same time?
Two threads are concurrent when they are both run at the same time meaning that they are both progressing. This can be done with context switching. For the threads to actually run at the same time multiple cores must be used, meaning that each thread must run on its own core.

### Briefly describe the progress graph and trajectories on it.
A progress graph is tool to visualize the execution states of two concurrently running threads. Each axis of the graph shows the sequential order of the thread and point is a execution state.
A trajectory is a sequence of state transition describing a concurrent execution of the two threads, which is visualized as a path from origo to the end only going up or to the right.

### What is a critical section and unsafe region in a progress graph? What is a “safe trajectory” on the progress graph?
The critical section is a section of each threads order of execution where they use a shared variable. This section should not be be interleaved between the two threads when run concurrently. The intersection between the two critical section is called the unsafe region, since it should not be crossed by the trajectory. A trajectory that avoids this region is therefore called a safe trajectory.

### What is a semaphore? What problem does it solve and how?
A semaphore, s, is a global integer value that is 0 or greater. It can only be manipulated by P and V operations, which are both called atomically meaning that only one thread can call them at a time, even if they are called at the same time one thread is set to have called the operation first. It therefore solves the problem of synchronization between threads avoiding the unsafe region of a progress graph.
P(s) decrements s by 1 and returns only if s is greater than 0. If s is equal to 0 it waits and suspends the thread until s is greater than 0 again.
V(s) increments s by 1 and returns. If there are any threads still waiting to finish a P operation, exactly one of those threads are restarted and complete its P operation.

### What is the difference between a mutex and a semaphore? Briefly describe both.
A mutex is a binary semaphore, meaning that they operate on the same idea, but semaphores are able to keep track of multiple shared variables while mutexes only keep track of a single variable.
They both work with a P operation that "locks" the variables and a V operation that "releases" the variables. It happens by incrementing or decrementing the mutex or semaphore by 1. The mutex starts at 1 and can't go below 0, while the semaphore starts at the number of variables it keeps track of and also can't go below 0.

### What is a thread safe function?
A function is called thread-safe if and only if it always produces the correct results even when called repeatedly from multiple concurrent threads. This means that the function has to protect shared variables.

### List and briefly describe the 4 classes of thread-unsafe functions!
The classes of thread-unsafe functions are:
1. Functions that do not protect shared variables, meaning that more threads can change the value of the same value at the same time leading to conflicts.
2. Functions that keep state across multiple calls, meaning that multiple instances of the same program would use the same static data to execute. An example is rand() which uses the output of the previous iteration to make the next "random" value.
3. Functions that return a pointer to a static variable. The problem with these functions are that one call of the function will change the variable and return a pointer to it, but when the function is again called the variable is changed and so is the value of what the previous pointer points to.
4. Functions that call thread-unsafe functions. These functions are thread-unsafe by proxy, but if the thread-unsafe function is of class 1 or 3 it can be made safe with a mutex.

### Briefly describe Amdahl’s law and give a numeric example of it!
Amdahl's law gives insight to the effectiveness of improving the performance of one part of a system. It shows that if you want to significantly speed up an entire system, you must improve the speed of a large fraction of that system. Mathematically it is written as
$$
S = \frac{1}{(1 - \alpha) + \frac{\alpha}{k}}
$$
where $\alpha$ is the fraction of the systems execution time that the single component requires to execute, and $k$ is the factor by which the performance of that component has been improved.
If the component took 60% of the systems time ($\alpha = 0.6$) and is sped up by a factor of 3 ($k=3$), the speedup of the entire system is
$$
S = \frac{1}{0.4 + \frac{0.6}{3}} = 1.67
$$
Even though the speedup of the single component was by a factor of 3, the entire system only got a benefit of a bit over half of that speedup.

## SECTION 03 - CENTRAL PROCESSING UNIT
### What is the Arithmetic/Logic unit? 
A combinational digital circuit that contains the necessary logic to do all the operations, that a CPU is capable of including arithmetic and bitwise operations on integers.

### What is the purpose of the hardware control language? 
Hardware control language is a way to program very simple processors which only supports boolean expressions as well as integers.

### What is a logic gate and what are the standard logic gate types? 
A logic gate is a simple building block for building digital circuits. They are capable of performing a boolean expression with electrical signals. The basic logic gates are the AND, OR, NOT, and XOR gates.

### What is instruction encoding? 
Instruction encoding is how the instructions for a processor is written. Each architecture has its own encoding but for Y86-64 it is encoded in 10 blocks of 2 values each. The first block holds onto the instruction code and function. The next blocks hold onto the options of the instruction and function, which could be registers, constants or memory.

### What is a register? 
A register is a part of a computers memory. The CPU uses the registers to hold onto data as well as accessing data from the main memory.

### What is the purpose of the Jump instruction? 
The jump instruction allows for branching and altering of control flow. In a more high level sense it allows for loops and conditional statements.

### What are the six general instruction processing stages? Briefly describe them. 
The six stages are as follows:
1. Fetch, where the instructions are read from memory to the CPU
2. Decode, where the register values are read
3. Execute, where computation is done on the given values
4. Memory, where a value can be written to or read from the memory
5. Write back, where a resulting value is written to the registers from the decode stage
6. PC update, where the program counter is updated to know which instruction is next

### What is the benefit of pipelining? 
Pipelining allows for multiple operations in a process running simultaneously if the process has to be run more than once. This can save a substantial amount of time when comparing to running a process to completion before starting the next process.

### What is the main limitation of pipelining? 
Since a process consists of multiple different operations, not all of them will require the same amount of time to execute. This is called non-uniform delays. The entire process's pipeline will therefore be bottlenecked by the slowest operation and the other stages will have to sit idly for some time for it to line up. 

### What are the two types of hazards in pipelining and why do they happen?
If there are dependencies between different operations of a process it could lead to data hazards if an operation reads from a register and the next operation writes to the same register. One operation would then need to wait for the other. Control hazards could also occur if an operation has to predict a conditional value to keep up with the pipeline, as to not be further delayed by the non-uniform delay problem. If the operation predicts a wrong value an extra instruction has to be made. 

## SECTION 04 - MEMORY MANAGEMENT
### What is the difference between volatile and nonvolatile memory? 
Volatile memory is easy to write to and can be written to by the CPU while in use. When electricity is no longer supplied to the volatile memory it deletes the current memory and starts fresh next session. Nonvolatile memory however is harder or impossible to write to after production, but does not delete itself after a reboot.

### Why does it take a long time to read or write a value in the main memory? 
There is a longer path between the CPU and the main memory compared to the cache requiring an interface, and has a larger capacity meaning there is more to look through.

### List 5 components from a disk drive and briefly describe them. 
A disk drive has a spindle that spins the platters. The platters holds onto the data. To read or write the data the arm has to move to the spot of the desired data. Other than the disk drive specific parts, the disk drive also has its own processor which controls all the reading and writing logic as well as its own main memory that the processor needs.

### What’s the easiest way for a HDD manufacturer to increase the capacity of a drive? 
The easiest way to increase the amount of platters.

### When a HDD needs to read an address, what takes up most of the time and what is free? 
The part that take the most time is the seek time, but the rotational latency is also slow. After finding the first bit of the sector however, the rest of the reading process is practically free.

### What is the advantage of logical disk blocks? 
Logical disk blocks abstracts the sector geometry into logical blocks. A separate device called the disk controller then converts from logical blocks into surface, track, and sector.

### Why does the CPU not wait for a disk read? 
If the CPU has to wait for the disk every time it would waste a lot of time since the disk is one of the slowest parts of a computer. It can therefore perform other instructions in the meantime. 

### How does it get the data instead? 
The disk controller reads the sector and sends it directly into main memory. When everything is done the disk controller notifies the CPU of it with an interrupt, where it then can access the data.

### Name a few advantages and disadvantages of SSD over HDD. What can we do about the disadvantages? 
SSDs are much faster than HDDs at reading and writing data. They also contain no mechanical/moving parts meaning that they are potentially more rugged. A downside is that they tend to be more expensive than HHDs but with the evolution of technology the price gap has lessened substantially. At some point SSDs also had a much lower lifetime since they wore out quicker, but modern SSDs have also mostly fixed this problem. If one is afraid of the wear however it can be mitigated by only using the SSD for the most important functionalities such as the boot drive, since it would require less reading and writing to it.

### Define temporal and spatial locality. How do they help with slow memory and disk access times? 
Temporal locality is the idea that recently accessed data is likely to be used by the program again. Spatial locality is the idea that data with nearby addresses to the recently referenced data is likely to be used by the same program.

### What is a Stride-1 access pattern, and what type of locality does it exploit? 
The stride-1 access pattern is a pattern where you reference array elements in succession. This utilizes spatial locality, since each array element is stored right next to its successor in memory.

### Briefly describe the memory hierarchy (2-3 sentences, focus on the most important properties) 
The memory hierarchy is based on the idea that the faster the memory the less capacity it has and the more it costs to use. It can be set up in a pyramid where the top is the fastest memory with least capacity, which are the registers. The bottom of the pyramid would then be secondary storage such as disk drives or potentially external drives in servers. The idea is that each upper level serves as a cache for the slower level below it.

### What is a data cache in general? 
Data cache is a memory device that can hold a subset of memory blocks from a larger and slower memory device.

### What is a cache miss and what happens when it occurs?
A cache miss occurs when data is requested from cache, but the cache does not have said data. What then happens is that the cache retrieves it from its lower level memory so it can have it ready for the next request.

### What is the difference between the 3 cache miss types? 
The three cache miss types and their descriptions are as follows:
* Cold (compulsory) miss, which happens when the memory block requested is currently empty.
* Conflict miss, which happens if the requested data is part of a memory block that has been retrieved, but the retrieved data is not the requested, meaning that the current data has to be overwritten.
* Capacity miss, which happens when the number of cache blocks is larger than the cache, meaning that the cache can not access all requested cache block.

### Approximately how many clock cycles does it take to access data from the following memories: registers, CPU caches, main memory, disk, network storage. 
Registers take 1 clock cycle. Cache takes 10 clock cycles. Main memory takes 100's of clock cycle. The disk takes 100000's of clock cycles. Network storage takes seconds to minutes worth of clock cycles.

### How do we calculate the cache size? 
Cache size, $C$, is calculated as $C = S \cdot E \cdot B$ bytes, where $S$ is the number of sets per cache, $E$ is the number of lines per set, and $B$ is the number of bytes per cache block.

### How does the cache controller interpret a memory address? 
The cache controller reads a memory address as a series of $t$ tag bits, $s$ set bits, and $b$ block bits.

### What is the “tag” in a cache line? 
The tag bits in a cache line chooses which cache block in the current set should be chosen.

### How do we read data from a direct mapped cache (step by step)? At which step do we know for sure if we have a cache hit or miss? 
First the set is found from the set bits. Since it is directly matched you also have the cache block. When the block is found you can check the validation bit to see if it is a cold miss. If the validation bit is set but the tag bits do not match it is a conflict miss. If it is not a miss, the block offset can be used to retrieve the data making it a cache hit.

### What is the “memory mountain”? 
The memory mountain is a way to characterize a memory systems performance. It is done by measuring throughput of a memory system as a function of spatial and temporal locality. This can be visualized as a mountainous graph hence the name.

### What is the main difference between physical and virtual memory addressing? 
Physical addressing is when the CPU has direct access to main memory and can request and retrieve specific addresses in the main memory. Virtual memory addressing is when the CPU requests a virtual address from a memory management unit which then translates it to a physical address to retrieve from main memory. 

### What are the main advantages of virtual memory? 
Virtual memory abstracts the memory which simplifies the memory management for each process since they can have their own address space without worrying about physical addresses or accessing other processes memory. It can also be more efficient since it uses main memory as cache.

### Why is virtual memory considered a cache? 
Virtual memory stores the data on the disk, but it serves the same purpose of caching in main memory, since it references DRAM in its virtual pages.

### What is a Page Table and a Page Fault? How are Page Faults handled? 
A page table is a cache block which works as a map from virtual memory to physical memory. Each element in the page table is called a virtual page. The virtual pages each map onto a physical page in the physical memory.
When a virtual address is referenced but the virtual page does not map onto a physical page, it results in a page fault. The page fault handler then has to replace one of the current physical pages with the physical page corresponding to the desired address.

### What is Memory Thrashing and why do poorly written programs cause it? 
Memory thrashing is when the performance drops substantially because pages are continuously swapped in and out. This typically happens if the working set (number of active virtual pages) is greater than the main memory size, since page faults are bound to happen more often. This can be avoided by having better locality since the working set will be smaller, meaning poorly written code with worse locality is prone to have more thrashing.

### Which one is larger, virtual or physical memory (in number of addressable bytes)?
Virtual memory is larger since it is stored on the disk. The whole idea is also that more virtual memory addresses can made than there is capacity in the physical memory.

### What problem is solved by the Translation Lookaside Buffer (TLB)? 
Without the TLB the page table entries would have to be stored in L1 cache just like any other memory word. This would defeat the purpose since you would have to wait for the L1 cache delay anyways. The TLB then sets a direct path from virtual page to physical page through the MMU.

### What is the motivation for using multi-level page tables? 
If you only used a single page table it would have to have a page table entry for every single address space, which would result in a unreasonably large page table. When using multi-level page tables you can further divide the load which cuts down on the size. It saves space by deleting page tables that are not in use, which it can do since 

### When using multi-level page tables, how does the memory manager interpret the virtual address? Illustrate your answer with a drawing!
In a k level level page table, the MMU will read the virtual address as k blocks of virtual page numbers and a last block with the virtual page offset. The virtual page numbers correspond to a page table until the level k page table, which holds the corresponding physical page number. The physical page number in addition to the page offset is then enough for the MMU to retrieve the data from memory.

Illustration: See page 794 in the slides.

## The questions below are not part of the material in the 2021 Spring semester.
### In what cases do we get a Segmentation Fault? 
When we try to access addresses which don't have access to, such as accessing an index of array larger than the size of the array.

### What is memory mapping and what is the swap file used for? 
Memory mapping is when 

### What is the heap and what functions can a C programmer use to interact with it and what do they do exactly? 


### How does malloc work in general, and what constraints must be satisfied by its implementations (allocators)? 


### What rules must be followed by a C programmer when using malloc? What happens when the rules are violated? 


### Why is it challenging to make a good memory allocator? (what goals does it have and why are they conflicting?) 


### What is internal and external fragmentation in memory allocation? 
Poor memory utilization caused by fragmentation.

### How does free() know how many bytes to deallocate when it receives a pointer?
When you run malloc it allocates enough space for the word, but preceding that it allocates an extra space to indicate the block size. When you run free, it can then go one space back from the pointer to find the amount of bytes to free. This is the standard method of doing this.