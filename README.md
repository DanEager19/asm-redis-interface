# Assembly Redis Interface

I've built a Redis database interface using x86 32-Bit Assembly. It utilizes the Redis CLI with system call 11 (sys_exec) to read, write, or delete a key-value pair. Additionally it comes with a simple text interface to allow for multiple commands in one session. This program therefore uses system calls 2 (sys_fork) and 7 (sys_wait) to multithread the processes.
