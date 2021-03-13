
require "pry"
require 'yaml'
MESSAGES=YAML.load_file('calculator_messages.yml')
LANGUAGE='en'

def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

# define a prompt method to make the input look nicer
=begin
def prompt(message)
  Kernel.puts("=> #{message}")
end 
=end

def prompt(key)
  message=messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

# create an integer validator
def integer?(num)
  num.to_i().to_s()==num
end

# create a float validator
def float?(num)
  num.to_f().to_s()==num
end

# overall validator that takes both integer and float
def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  word=case op
  when '1'
    prompt('adding')
  when '2'
    prompt('subtracting')
  when '3'
    prompt('multiplying')
  when '4'
    prompt('dividing')
  end
  x="This won't output anything but allows for more code"
  word
end

# get user name for a personalized program

prompt('ask_name')
name=''

loop do
  name=Kernel.gets().chomp()
  if name.empty?()
    prompt ('valid_name')
  else
    break
  end
end

# offer a nice welcome
print prompt ('welcome')
puts name
#returned_welcome=p prompt('welcome')
#return returned_welcome + name.to_s

loop do #main loop

  # get two integers from user
  num1=''
  loop do
  prompt ('num1_prompt')
  num1=Kernel.gets.chomp()
  if number?(num1)
    break
  else
    prompt ('num_invalid')
  end
  end

  num2=''

  loop do
  prompt ('num2_prompt')
  num2=Kernel.gets.chomp()
  if number?(num2)
    break
  else
     prompt ('num_invalid')  
  end
  end

  # get desired oeprator from user
  # make input screen look nicer
  operator=''

  operator_prompt=('operator_prompt')

  prompt(operator_prompt)

  loop do
  operator=Kernel.gets.chomp()
  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt ('operator_invalid')
  end
  end

  #puts '#{operation_to_message(operator)}'.to_s + prompt('the_two_numbers')

  puts("#{operation_to_message(operator)}", prompt('the_two_numbers'))

  # calculate and provide output
  result=case operator 
  when '1'
    num1.to_f()+num2.to_f()
  when '2'
    num1.to_f()-num2.to_f()
  when '3'
    num1.to_f()*num2.to_f()
  when '4'
    num1.to_f()/num2.to_f()
  end

  #prompt("Result is #{result}")
  puts("Result is #{result}")


  prompt('try_again')
  answer=Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

  prompt('goodbye')
