require_relative "prime_quiz"

if (ARGV.size == 0)
		puts "Usage: ruby main.rb number"
		exit -1
end
quiz_main(ARGV[0].to_i)

