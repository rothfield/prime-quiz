*Coding Challenge*

Write a program to generate a multiplication table of prime numbers

*To run:*

ruby main.rb 4                                                                             

*To test:*

ruby test_prime_quiz.rb


*Discussion*

I used the following as reference for creating an incremental sieve.
The incremental sieve differs from the traditional sieve in that you can
specify the number of primes you want and the code "lazily" fills in the multiples as needed. With the traditional sieve you choose the sieve size and aren't guaranteed a particular number of primes

[The Genuine Sieve of Eratosthenes](http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf)

*Test Results*

Generated 100000 primes in 3.997334241 seconds
Generated 1000000 primes in 70.040366216 seconds
Generated 1000 primes plus table in 0.636984514 seconds
Generated 5000 primes plus table in 16.971695681 seconds

*Discussion of test results*

The table generation is dominating and is of order O(nsquared) as expected. The literature states that the sieve is 

O(log n)(log log n)

The table generator is O(n^2)

O(n^2) is larger than O(log n)(log log n) 

So table generation dominates the problem.

The code doesn't scale very well, due to the table generation being O(n^2) . I see no way around this.

*Text of Coding challenge*

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


