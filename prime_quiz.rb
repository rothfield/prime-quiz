# Reference:
# The Genuine Sieve of Eratosthenes
# Melissa E. O’Neill
#
#   Whereas the original algorithm crosses off all multiples of a prime at once,
#  	we perform these “crossings off” in a lazier way: crossing off just-in-time.
#  	For this purpose, we will store a table in which, for each prime p that we have discovered so far, there is an “iterator” holding the next multiple of p to cross off.
#  	Thus, instead of crossing off all the multiples of, say, 17, at once (impossible, since there are infinitely many for our limit-free algorithm), we will store the first one (at 17 × 17; i.e., 289) in our table of upcoming composite numbers.
#  	When we come to consider whether 289 is prime, we will check our composites table and discover that it is a known composite with 17 as a factor, remove 289 from the table, and insert 306 (i.e., 289 + 17).
#  In essence, we are storing “iterators” in a table keyed by the current value of each iterator.

def generate_primes(target)
		# Returns an array of the first <target> number of primes
		index=2
		composite_numbers=Hash.new() # a lazy sieve
		primes=[]
		while (primes.size != target) do
				factors=composite_numbers[index]
				puts "factors[#{index}]=> #{factors}" if false
				composite_numbers[index]=nil # clear memory
				is_prime= factors.nil?
				if is_prime
						primes << index
						composite_numbers[index * index]=[index]  # Use times here!
				else
						factors.each do |factor|
								which=index + factor
								if composite_numbers[which]
									 	composite_numbers[which] << factor
								else
										composite_numbers[which]=[factor]
								end
						end
				end
				index= index + 1 
		end
		primes
end

def quiz_main(target)
		x=generate_primes(target)
		generate_multiplication_table(x)
		""
end

def generate_multiplication_table(ary)
		# generate a multiplication table, tab separated for the given array
		# Writes to stdout
		header= [""] + ary
		puts header.join("\t")
		ary.each do |x|
				z = ary.collect { |y| x * y }
				z2= [x] + z
				puts  z2.join("\t")
		end
end


