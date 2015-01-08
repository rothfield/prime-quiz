I used the following as reference for creating an incremental sieve.

[http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf]

My timing tests for prime generation ONLY

Generated 1000 * 1000 primes in 92.026719947 seconds
Generated 100 * 1000 primes in 18.000957512 seconds


I ran some tests for multiplication table generation:

time ruby main.rb 1000 > /dev/null

ruby main.rb 1000 > /dev/null  0.69s user 0.04s system 95% cpu 0.770 total

[john@debian:~/prime-quiz ]$ time ruby main.rb 10000 > /dev/null
ruby main.rb 10000 > /dev/null  66.10s user 0.05s system 99% cpu 1:06.35 total

Results:

1,000  =>  0.69s user 0.04s system 95% cpu 0.770 total

10,000 => 66.10s user 0.05s system 99% cpu 1:06.35 total

Conclusion: The table generation is dominating and is of order O(nsquared) as expected. The literature states that the sieve is 

O(log n)(log log n)

The table generator is O(n^2)

My sources state that O(n^2) is the larger than O(log n)(log log n)

Therefore, the table generation dominates the problem.
My code doesn't scale very well. Perhaps my sieve code could be tweaked to save the products as it goes along. The algorithm is already calculating multiples.
-----------------------------------------------------------------
*Coding challenge*

Objective
Write a program that prints out a multiplication table of the ﬁrst 10 prime
numbers.
The program must run from the command line and print one table to
STDOUT.
The ﬁrst row and column of the table should have the 10 primes, with
each cell containing the product of the primes for the corresponding row and
column.

Notes
• Consider complexity. How fast does your code run? How does it scale?
• Consider cases where we want N primes.
• Do not use the Prime class from stdlib (write your own code).
• Write tests. Try to demonstrate TDD/BDD.

When you’re done
Put your code on GitHub or email us a zip/tarball.

Thanks!

1


