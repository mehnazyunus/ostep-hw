### Q1
Write a program that calls fork(). Before calling fork(), have the main process access a variable (e.g., x) and set its value to something (e.g., 100). 

What value is the variable in the child process? 100

What happens to the variable when both the child and parent change the value of x? They each have their own copy.

### Q2
**Write a program that opens a file (with the open() system call) and then calls fork() to create a new process. Can both the child and parent access the file descriptor returned by open()? What happens when they are writing to the file concurrently, i.e., at the same time?**
File gets overwritten 

### Q3
**Write another program using fork(). The child process should print “hello”; the parent process should print “goodbye”. You should try to ensure that the child process always prints first; can you do this without calling wait() in the parent?**
Use sleep() ?

### Q4

### Q5
 **Now write a program that uses wait() to wait for the child process to finish in the parent. What does wait() return? What happens if you use wait() in the child?** 
wait() returns the pid of the child.
wait() in child - wait() returns -1, since the child has no child processes to wait for. The errno will be set to ECHILD, indicating that the calling process has no child processes.


### Q6
waitpid - to wait for a particular child process by passing in its pid

### Q7
printf after close on standard output - does not get printed

### Q8
piped output printing before print in child 2?

## 8. MLFQ
2. 
Eg 1 - ./mlfq.py -n 3 -j 1 -A 1,1,1 -M 0 
3 queues, 1 job, IO freq is 0 (no IO)

3. ./mlfq.py -n 1 -j 3 -l 0,20,0:0,20,0:0,20,0 -c
1 queue, 3 jobs, all arrive at time 0, total time is 20ms, none have IO

4, 5 - where to see CPU time?

## 10. Multiprocessor Scheduling
At the end of every time slice, the scheduler checks if there are any processes waiting and schedules them if any. (central scheduling queue)
5. Working set of b and c can fit in a cache at the same time. But when a is scheduled on that CPU, it evicts both b and c's workng sets
./multi.py -n 2 -L a:100:100,b:100:50,c:100:50 -c -t -C -T
6. So pinning b and c to a CPU takes less time, since the caches remain warm.
./multi.py -n 2 -L a:100:100,b:100:50,c:100:50 -A a:0,b:1,c:1 -c -t -C -T
7. With two CPUs, the eviction pattern seen in 5 is seen again. The time taken simply halves as compared to the single CPU case. But with three CPUs (and cache size = working set), we see a higher than linear speedup because each process has its own CPU and can use a warmed up cache.
8. Not as good as hand-pinning because 
Scheduler CPU 0 queue: ['a', 'c']
Scheduler CPU 1 queue: ['b']
and a and c do not fit in the cache together, whereas b and c do.