Ruby Collections: Selection and Transformation (Lesson 4: Collections)

What can be done with a collection?
* Iteration
* Selection: e.g. picking all the odd numbers from an array
* Transformation: e.g. manipulating every element in an array, increment every element by 1

* Selection results in n or n or less elements; transformation always results in n elements

Selection and transformation uses looping, with 4 elements of iteration, plus one more:

* loop
* counter
* way to retrieve current value
* exit the loop
* +: some criteria

Example 1: Looping to Select and Transform
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0 

loop do 
    current_char = alphabet[counter] 
        
        if current_char == 'g' 
            selected_chars << current_char     # appends current_char into the selected_chars string 
        end 

        counter += 1 
        break if counter == alphabet.size 
end 
selected_chars                                  # => "g"
```

Example 2: Applying the selection criteria also to transformation
```ruby
fruits = ['apple', 'banana', 'pear’]

transformed_elements = []
counter = 0 
loop do 
    current_element = fruits[counter] 
    transformed_elements << current_element + 's'     # appends transformed string into array 
    counter += 1 
    break if counter == fruits.size 
end 

transformed_elements                             # => ["apples", "bananas", "pears"]
```

Example 3: Extracting a selection or transformation to a method
```ruby
def select_vowels(str) 
    selected_chars = ‘' 
    counter = 0 

    loop do 
        current_char = str[counter]
        
        if 'aeiouAEIOU'.include?(current_char)
            selected_chars << current_char 
        end 

        counter += 1 
        break if counter == str.size 
    end 

    selected_chars 
end

select_vowels('the quick brown fox')         # => "euioo" 
sentence = 'I wandered lonely as a cloud'
select_vowels(sentence)                      # => “Iaeeoeaaou"

number_of_vowels = select_vowels('hello world').size 
number_of_vowels                             # => 3
```

Example 4: Hash extracted to a method
```ruby
produce = { 'apple' => 'Fruit', 'carrot' => 'Vegetable', 'pear' => 'Fruit', 'broccoli' => 'Vegetable’}

def select_fruit(produce_list) 
    produce_keys = produce_list.keys 
    counter = 0 
    selected_fruits = {} 

    loop do # this has to be at the top in case produce_list is empty hash 
        break if counter == produce_keys.size 
        
        current_key = produce_keys[counter] 
        current_value = produce_list[current_key] 

        if current_value == 'Fruit’ 
            selected_fruits[current_key] = current_value 
        end 

        counter += 1 
     end 

    selected_fruits 
end

select_fruit(produce)             # => {"apple"=>"Fruit", "pear"=>"Fruit"}
```

Example 5: Entire transformation code is within the method definition
```ruby
def double_numbers(numbers) 
    doubled_numbers = [] 
    counter = 0 

    loop do 
        break if counter == numbers.size 

        current_number = numbers[counter] 
        doubled_numbers << current_number * 2 

        counter += 1 
    end 

    doubled_numbers 
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers)             # => [2, 8, 6, 14, 4, 12]
```

Example 5b: Implementing a method that mutates its argument
```ruby
def double_numbers!(numbers) 
    counter = 0 
    
    loop do 
        break if counter == numbers.size 

        current_number = numbers[counter] 
        numbers[counter] = current_number * 2 

        counter += 1 
    end 
    numbers 
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers)         # => [2, 8, 6, 14, 4, 12] 
my_numbers                         # => [2, 8, 6, 14, 4, 12]
```

Example 6: Method that transforms only a subset of elements in collection
```ruby
def double_odd_numbers(numbers) 
    doubled_numbers = [] 
    counter = 0 

    loop do 
        break if counter == numbers.size 
        
        current_number = numbers[counter] 
        current_number *= 2 if current_number.odd? 
        doubled_numbers << current_number 

        counter += 1 
    end 
    
    doubled_numbers 
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers) # => [2, 4, 6, 14, 2, 6] 

# not mutated
my_numbers                     # => [1, 4, 3, 7, 2, 6]
```
Example 6b: Transforming subset of elements based on its position in collection 

```ruby
def double_odd_indices(numbers) 
    doubled_numbers = [] 
    counter = 0 

    loop do 
        break if counter == numbers.size 
        
        current_number = numbers[counter] 
        current_number *= 2 if counter.odd? 
        doubled_numbers << current_number 

        counter += 1 
    end 
    
    doubled_numbers 
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_indices(my_numbers) # => [1, 8, 3, 14, 2, 12] 
```

Example 7: More flexible methods
```ruby
def general_select(produce_list, selection_criteria) 
    produce_keys = produce_list.keys 
    counter = 0 
    selected_fruits = {} 

    loop do 
        break if counter == produce_keys.size 

        current_key = produce_keys[counter] 
        current_value = produce_list[current_key] 

        # used to be current_value == 'Fruit’ 
        if current_value == selection_criteria 
            selected_fruits[current_key] = current_value 
        end 
    
        counter += 1 
    end 

    selected_fruits 
end

produce = { 
    'apple' => 'Fruit’, 
    'carrot' => 'Vegetable’, 
    'pear' => 'Fruit’, 
    'broccoli' => ‘Vegetable'
} 

general_select(produce, 'Fruit')         # => {"apple"=>"Fruit", "pear"=>"Fruit”}
general_select(produce, 'Vegetable')     # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable”}
general_select(produce, 'Meat')          # => {}
```

Example 8: Method that take an additional argument to determine the transformation criteria
```ruby
def multiply(numbers, multiplier) 
    multiplied_numbers = [] 
    counter = 0 
    
    loop do 
        break if counter == numbers.size 

        multiplied_numbers << numbers[counter] * multiplier 
        counter += 1 
    end

    multiplied_numbers 
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3)             # => [3, 12, 9, 21, 6, 18]
```
Example 9: Method that takes a string and returns a new string containing only the letter specified.
```ruby
def select_letter(sentence, character) 
    selected_chars = ‘' 
    counter = 0 

    loop do
        break if counter == sentence.size 
        current_char = sentence[counter] 

        if current_char == character 
            selected_chars << current_char 
        end 

        counter += 1 
end 
    
    selected_chars 
end

question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a')                                 # => "aaaaaaaa"
select_letter(question, 't')                                 # => "ttttt"
select_letter(question, 'z')                                 # => ""

select_letter(question, 'a').size # => 8
select_letter(question, 't').size # => 5
select_letter(question, 'z').size # => 0
```
Example 10: The for loop

* The for loop produces the same results as the loop
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz’ 

for char in alphabet.chars 
    puts char 
end
```