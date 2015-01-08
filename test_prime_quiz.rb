gem 'minitest'
require 'minitest/autorun'

class TestPrimeQuiz < Minitest::Test

		require_relative "prime_quiz"
		require_relative "test_helper"

		include TestHelper

		def test_first_ten_primes
				primes=generate_primes(10)
				assert(primes == [2,3,5,7,11,13,17,19,23,29])
		end

		def test_multiplication_table
				old_stdout=$stdout
				foo=StringIO.new
				$stdout = foo
				generate_multiplication_table([2,3])
				assert($stdout.string == "\t2\t3\n2\t4\t6\n3\t6\t9\n")
				$stdout=old_stdout
		end

		def test_generate_and_create_table_for_thousand_primes
				prime_generation_and_table_generation_timer(1000)
		end

		def test_generate_and_create_table_for_five_thousand_primes
				prime_generation_and_table_generation_timer(5 * 1000)
		end

		def test_generate_ten_thousand_primes
				primes=generate_primes(10 * 1000)
				assert(primes == TEN_THOUSAND_PRIMES)
		end

		def test_generate_million_primes
				seconds=prime_generation_timer(1000 * 1000)
				puts "generated a million primes in #{seconds}"
		end

		def test_generate_hundred_thousand_primes_in_under_30_seconds
				seconds=prime_generation_timer(100 * 1000)
				expected=30
				assert(seconds < 30, "Expected it to take under #{30} seconds. It took #{seconds}")
		end

		def prime_generation_and_table_generation_timer(target)
				orig_std_out = STDOUT.clone
				STDOUT.reopen "/dev/null", "w"
				beginning_time = Time.now
				primes=generate_primes(target)
				generate_multiplication_table(primes)
				end_time=Time.now
				elapsed=(end_time - beginning_time)
				STDOUT.reopen(orig_std_out)
				puts "Generated #{target} primes plus table in #{elapsed} seconds"
				elapsed
		end

		def prime_generation_timer(target)
				beginning_time = Time.now
				generate_primes(target)
				end_time=Time.now
				elapsed=(end_time - beginning_time)
				puts "Generated #{target} primes in #{elapsed} seconds"
				elapsed
		end

end
