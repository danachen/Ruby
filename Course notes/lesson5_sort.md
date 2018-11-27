Lesson 5: Advanced Ruby Collections (Sort)

Sorting
* Mostly performed on arrays
* String has no access to sorting methods
* Hash: not really needed since they are accessed through keys only
* There are two methods, #sort and #sort_by, return value is a new array with integers sorted according to value

How is sorting performed?
* Essentially through comparison, comparing items in a collection with each other, and ordering them based on result of that collection
* Sorting uses <=>, the spaceship operator to determine what comes before or after

The <=> method    
* Performs comparison between two objects of the same type, returns -1, 0, or 1

2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil

* If <=> returns nil then it throws and argument error
* #sort is only concerned about the return value of <=> method, so it’s always looking for -1, 0, 1, or nil

If you want to sort a collection with a particular type of objects (strings, integers), then two things are important:
1. Does the object type implement the <=> type?
2. If yes, what’s the specific implementation of the method for that object type? String#<=> is implemented differently than the Fixsum#<=>

ASCII table

'A' <=> 'a' # => -1, because A appears before a in the ASCII table
'!' <=> 'A' # => -1, ! precedes A
'b'.ord # => 98
'}'.ord # => 125 # call .ord on the string to determine ASCII position
'b' <=> '}' # => -1, since 98<125

* Upper cases come before lower cases
* Digits and punctuations come before letters

Calling #sort on a block

* Needs two arguments to compare, and return value of block is -1, 0, 1, or nil
```ruby
[2, 5, 3, 4, 1].sort do |a, b| 
    a <=> b 
end
# => [1, 2, 3, 4, 5]
```

* In the above example, Fixnum#<=> in the block performs the comparison
* In the below example, switching the order in which items are compared, the new array is in descending order

```ruby
[2, 5, 3, 4, 1].sort do |a, b| 
    b <=> a
end
# => [5, 4, 3, 2, 1]
```

* Can also write code in the block, through string interpolation
```ruby
[2, 5, 3, 4, 1].sort do |a, b| 
    puts “a is #{a} and b is #{b}"
    a <=> b 
end
# a is 2 and b is 5
# a is 4 and b is 1
# a is 3 and b is 1
# a is 3 and b is 4
# a is 2 and b is 1
# a is 2 and b is 3
# a is 5 and b is 3
# a is 5 and b is 4
# => [1, 2, 3, 4, 5]
```
String#<=> method
```ruby
['arc', 'bat', 'cape', 'ants', 'cap'].sort
# => ["ants", "arc", "bat", "cap", "cape"]
```
* Compared character by character
* Comparing cap to cape, the longer one is considered greater

Array#<=> method
```ruby
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]
```
* # Typically, comparing a string with an integer will throw an error
* # In this case, it didn’t happen because the comparison didn’t get that far

* This would’ve thrown an error since this comparison was carried out
* cat is compared with 2

```ruby
[['a', 'cat', 'b', 'c'], ['a', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort 
# => ArgumentError: comparison of Array with Array failed
```

* #sort_by method
* Called with a block
* Code in block determines how items are compared

```ruby
['cot', 'bed', 'mat'].sort_by do |word| 
    word[1]
end
# => ["mat", "bed", "cot"]
```

* Sorting using character at index 1 of each string, so comparing o, e, and a, other characters are ignored completely
* If you must sort a hash, then a sort_by is the way to go

`people = { Kate: 27, john: 25, Mike:  18 }`

* # If sorting the hash by age
```ruby
people.sort_by do |name, age| 
    age 
end
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]
```

* Note that sort_by always returns an array even if called on a hash, here it returns a new array with key-value pairs as objects in nested arrays
* Can always use Array#to_h to convert back to hash
* What if we want to order hash by name rather than age?
* Names in the example are symbols
* The object you want to work with has to implement a <=> method
* What is the protocol for Symbol#<=>? It compares strings

```ruby
people.sort_by do |name, age| 
    name.capitalize
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]
```

* Using the #capitalize method means it’s sorted as if the keys are capitalized, but still returns the original values in the array
* both #sort and #sort_by have destructive methods #sort! and #sort_by!, these are specific to arrays and not available to hashes

Other methods that use <=>
* min
* max
* minmax
* min_by
* max_by
* minmax_by

