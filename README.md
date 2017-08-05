This project implements sleep sort in Erlang.

In this algorithm we create different threads for each of the elements in the input array and then each thread sleeps for an amount of time which is proportional to the value of corresponding array element.

Hence, the thread having the least amount of sleeping time wakes up first and the number gets printed and then the second least element and so on. The largest element wakes up after a long time and then the element gets printed at the last. Thus the output is a sorted one.

All this multithreading process happens in background and at the core of the OS. We do not get to know anything about what’s happening in the background, hence this is a “mysterious” sorting algorithm.

I have used erlang:send_after in one implementation and a combination of timer:sleep and spawn() in another.

Also time(N) can be used to find the time taken to sort N elements.

Timing of the function:
-----------------------

1000 elements took 0.11 seconds!
10000 elements took 0.125 seconds!
100000 elements took 0.203 seconds!

