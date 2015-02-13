# WHILE LOOPS
# b = 0

# while b <= 10
# 	puts "b is now #{b}"
# 	b += 1
# end


# UNTIL LOOPS
# b = 0

# until b > 10 do
# 	puts "b is now #{b}"
# 	b += 1
# end

# name = ""

# until name == "Brandon" do
# 	print "What is your name?"
# 	name = gets.chomp
# 	puts "Hello, #{name}"
# end




# FOR LOOPS
# for animal in %w(bird, cat, dog, toad) do
# 	puts "The current animal is #{animal}"
# end



# RUBY BLOCKS!!!!!!!!!
# THEY ARE A SYNTAX IN THE RUBY LANGUAGE

# def say_hello(&block)
# 	puts "Hello, world"
# 	block.call
# 	# block.call is telling ruby to take the contents of the block
# 	# and evaluate it inside of the say_hello method
# end

# # This is the code in the block
# # { }'s have a higher priority in ruby over the do-end blok style 
# say_hello {puts "Hello again" }
# # This is another way of writing the block
# say_hello do
# 	puts "Hello again"
# end


# def say_hello(&block)
# 	puts "Hello, world"
# 	if block_given?
# 		block.call
# 	else
# 		puts "no block was given"
# 	end
# end

# say_hello do
# 	puts "Hello again"
# end


# def say_hello(&block)
# 	puts "Hello, world"
# 	name = block.call
# 	puts "You entered #{name} as your name."
# end

# say_hello { "Brandon" }

# BLOCK RESCUE AND ENSURE 
# def header(&block)
# 	puts "This is our header"
# 	block.call
# 	puts "This is our footer"
# rescue
# 	puts "This is where we would rescue an error."
# ensure 
# 	puts "I am inside of the ensure block."
# end

# header do
# 	puts "This is the body of the block."
# 	raise "This is an error."
# end


# BEGIN AND END BLOCKS
# puts "This is the first line of our Ruby program."

# BEGIN { puts "INSIDE OF THE BEGIN BLOCK"}
# END { puts "INSIDE OF THE END BLOCK"}



# THE YIELD KEYWORD
# Yield will break out of a block and run code, 
# and then return to the method that it was called in.
# Anything you do inside of the block
# will not affect your previous code.

# def say_hello(&block)
# 	puts "Hello, world"
# 	yield 
# 	puts "I said hello"
# end

# say_hello do
# 	puts "I am inside of the say_hello block."
# end




# def show_numbers(numbers=10)
# 	i = 0
# 	while i < 10
# 		yield i
# 		i += 1
# 	end
# end

# show_numbers do |number|
# 	puts "The current number is #{number}."
# 	number = number *2
# 	puts "The current number multiplied by 2 is #{number}."
# end

# def get_name(&block)
# 	print "Enter your name: "
# 	name = gets.chomp
# 	yield name
# 	puts "It was nice to meet you, #{name}."
# end

# get_name do |name|
# 	puts "Hi, #{name}."
# 	name = name.upcase
# 	puts "Uppercased, your name is #{name}."
# end



# PROCS AND LAMBDAS - CLOSURES
# Basically blocks that have been assigned to variables

# You must add a variable name to Proc or Lambda (ex. my_proc)
# because Proc and Lambda are ruby keywords.

# In IRB
# PROCS
# 2.1.3 :003 > my_proc = Proc.new {}
# #<Proc:0x007feceb884ae8@(irb):3>
# 2.1.3 :004 > my_proc
# #<Proc:0x007feceb884ae8@(irb):3>
# 2.1.3 :005 > my_proc = proc { puts "Hello world" }
# #<Proc:0x007feceb846270@(irb):5>
# 2.1.3 :006 > my_proc.call
# Hello world
# nil
# 2.1.3 :007 > 

# LAMBDAS
# 2.1.3 :007 > my_lambda = lambda { }
# #<Proc:0x007feced0f7e90@(irb):7 (lambda)>
# 2.1.3 :008 > my_lambda = -> { }
# #<Proc:0x007feceb970538@(irb):11 (lambda)>
# 2.1.3 :009 > 

# Procs can be given arguments by placing 
# the argument names inside of pipes ||

# 2.1.3 :012 > my_proc = proc { |name| puts "Hello, #{name}" }
# #<Proc:0x007feceb962960@(irb):12>
# 2.1.3 :013 > my_proc.call
# Hello, 
# nil
# 2.1.3 :014 > my_proc.call "Brandon"
# Hello, Brandon
# nil
# 2.1.3 :015 > my_proc.call("Brandon")
# Hello, Brandon
# nil

# Lambdas
# Unlike Procs, Lambdas require the exact number of 
# arguments as specified hen created
# 2.1.3 :017 > my_lambda = lambda { |name| puts "Hello, #{name}" }
# #<Proc:0x007feceb8f5ba8@(irb):17 (lambda)>
# 2.1.3 :018 > my_lambda.call "Brandon"
# Hello, Brandon
# nil
# 2.1.3 :019 > my_lambda.call 
# ArgumentError: wrong number of arguments (0 for 1)
# 	from (irb):17:in `block in irb_binding'
# 	from (irb):19:in `call'
# 	from (irb):19
# 	from /Users/brandonbaum/.rvm/rubies/ruby-2.1.3/bin/irb:11:in `<main>'
# 2.1.3 :020 > 

# def return_from_proc
# 	variable = proc { return "returning from proc inside method"}
# 	variable.call
# 	return "returning from proc as last line from method"
# end

# def return_from_lambda
# 	variable = lambda { return "returning from lambda inside method"}
# 	variable.call
# 	return "returning from lambda as last line from method"
# end

# puts return_from_proc
# puts return_from_lambda

# OUTPUTS
# Brandons-MacBook-Air:desktop brandonbaum$ ruby ruby.rb
# returning from proc inside method
# returning from lambda as last line from method

# class Paper
# 	def initialize(&block)
# 		yield self if block_given?
# 	end

# 	def set_variable
# 		return Proc.new do |kind, val|
# 			[kind, val].join(": ")
# 		end
# 	end

# 	def title(value)
# 		@title = set_variable.call "TITLE", value
# 	end

# 	def heading(value)
# 		@heading = set_variable.call "HEADING", value
# 	end

# 	def body(value)
# 		@body = set_variable.call "BODY", value
# 	end

# 	def display
# 		puts @title  
# 		puts "------------"
# 		puts @heading
# 		puts "------------"
# 		puts @body
# 		puts "------------"
# 	end
# end

# paper = Paper.new do |p|
# 	p.title 	"My awesome paper"
# 	p.heading 	"This is my paper"
# 	p.body 		"The entire contents of my paper would go here."
# end

# paper.display





# MODULES
# Naming has to be capitalized for Modules
# module Treehouse
# 	MASCOT = "Mike The Frog"

# 	class Frog
# 		attr_accessor :name
# 	end
# end


# In IRB
# 2.1.3 :002 > load 'ruby.rb'
# true
# 2.1.3 :003 > Treehouse
# Treehouse
# 2.1.3 :004 > Treehouse.inspect
# "Treehouse"
# 2.1.3 :005 > Treehouse.class
# Module < Object
# 2.1.3 :006 > load 'ruby.rb'
# true
# 2.1.3 :007 > Treehouse::MASCOT <-- The :: tells Ruby that you want to go inside of the 
								   # Module to get something
# "Mike The Frog"
# 2.1.3 :008 > 



# EXTEND AND INCLUDE
# Modifies objects and classes with Modules

# EXTEND adds the instance methods to the object. 
	# Makes methods available to the class
	# Calling Extend inside of the class, the methods
	# would be added to the class

# INCLUDE makes the methods availabe to an instance of the class

# module SayHello
# 	def say_hello
# 		puts "Hello #{@name}"
# 	end
# end

# class Hello
# 	include SayHello  <-- With include you can get rid of Extend

# 	def initialize(name)
# 		@name = name
# 	end
# end

# hello = Hello.new("Brandon")
# # hello.extend SayHello

# hello.say_hello





# RUBY CORE

# SYMBOLS - similar to strings but symbols only exist in memory once in ruby
# class BankAccount
# 	def initialize(name)
# 		@name = name
# 		@transactions = []
# 	end
	 
# 	def deposit(amount, options={})
# 		options[:memo] ||= 'Regular deposit.'
# 		@transactions.push({:amount => amount, :memo => options[:memo]})
# 	end
# end

# bank_account = BankAccount.new("Brandon")
# bank_account.deposit(100)
# bank_account.deposit(100, {:memo => "This was a gift."})

# puts bank_account.inspect

# # In IRB
# Brandons-MacBook-Air:desktop brandonbaum$ ruby ruby.rb
# #<BankAccount:0x007fb43b871cb0 @name="Brandon", @transactions=[{:amount=>100, :memo=>"Regular deposit."}, {:amount=>100, :memo=>"This was a gift."}]>
# Brandons-MacBook-Air:desktop brandonbaum$ 


# ENUMERABLE
# The Enumerable module can be included in your, 
# classes to easily give you the ability to sort, 
# traverse, and search your classes.

# COMPARABLE
# When you impement the <=> and include the Comparable Module
# you get the > < or ==

# IO
# Input and Output 
# Implemented in the file class

# File.open("./my_file.txt", "w+")
# Look at IO Documentation online for other methods

# STRUCT
# Is a convenient way to bundle a number of attributes together, 
# using accessor methods, without having to write an explicit class


































