Lesson 4: Methods

Example 1: Using a loop to iterate over a collection

```ruby
numbers = [1, 2, 3]
counter = 0 

loop do 
    break if counter == numbers.size 
    puts numbers[counter] 
    counter += 1
end
```
This can be done using a built-in method. 
```ruby
[1, 2, 3].each do |num| 
    puts num 
end
```
Working with an array 
[1, 2, 3]
each
 is a method called on the array. Method takes a block, 
do…end
and code within each block is executed for each iteration. 
The code within the blocks is 
puts sum
so each element of the array will be output by the 
puts
method.

How does each block know what
num
 is? For each iteration,
each
 sends the value of the current element to the block in form of an argument. Argument of the block is
num
 and represents value of the current element in the array. 

Working with an array, there’s only one element per iteration which
each
 knows, so each sends the block only one argument
num
Hashes need two argument to represent both key and value per iteration. 

Example 2: Calling each on a hash. 
```ruby
hash = { a: 1, b: 2, c: 3 } 
hash.each do |key, value| 
    puts "The key is #{key} and the value is #{value}”
end
```
Hash needs two arguments to represent both key and value per iteration. The block has two arguments.

Example 3: The differences in return value between iterating over an array or hash using loop versus each. 

Once each is done iterating, it returns the original collection.
```ruby
irb :001 > [1, 2, 3].each do |num| 
irb :002 > puts num 
irb :003 > end 1 2 3 => [1, 2, 3]
```
[1, 2, 3].each
is the last expression, so return value of the entire expression is the return of the each invocation. 

Example 4: Placing each within a method. 

Return value of the method is the last expression within the method. 
```ruby
def a_method 
    [1, 2, 3].each do |num| 
        puts num * 2 
    end
end
```
When calling method, return value is [1, 2, 3], because the last expression in method is [1, 2, 3].each, with return value of [1, 2, 3]. 

Example 5: Return value of a method with .each 
```ruby
def a_method 
    [1, 2, 3].each do |num| 
        puts num * 2 
    end 
    
    puts ‘hi'
end
```
Return value is now nil. Last expression of the method is now puts ‘hi’. puts always return nil, so the return value of the whole method is nil. 

Example 6: Using .select to perform selection.
```ruby
[1, 2, 3].select do |num| 
    num.odd?
end
```
select evaluates the return value of the block. block returns a value on each iteration, then gets evaluated by select. Return value of the block is the return value of the last expression within block. 

select only cares about the truthiness the block’s return value. Everything in Ruby is truthy except for nil or false. Not true, but truthy. 

If the return value is truthy, then element during that iteration will be selected. If falsey, then element will not be selected.
```ruby
[1, 2, 3].select do |num| 
    num + 1
end
```
Return value will always be an integer, n+1 is the last expression in the block. Block implicitly returns an integer, truthy value. 

What’s the return value of select? select performs selection based on truthiness of block’s return value. If return value is always truthy, then all elements are selected. When element is selected, it’s placed in a new collection. Once select is done iterating, it returns a new collection containing all selected elements. Selection criteria (block’s return value) is truthy for every element in the array.
```ruby
irb :001 > [1, 2, 3].select do |num| 
irb :002 > num + 1 
irb :003 > end 
=> [1, 2, 3]
```
Example 7: Return value of #select
```ruby
[1, 2, 3].select do |num| 
    num + 1 
    puts num 
end            # => 1 2 3 []
```
How does puts num affect the return value of #select?
* select now returns an empty array
* puts num is the last evaluated expression in the block
* Return value of the last evaluated expression in the block determines the return value of the block
* puts always return nil
* nil is considered a falsey value
* So select will not select any elements because return value will always be falsey

Example 8: Return value of #map
```ruby
[1, 2, 3].map do |num| 
    num * 2
end                    #=> [2, 4, 6]
```
map uses the return value of the block to perform transformation instead of selection
* In this example, map uses the product of num and 2 and places it in a new collection
* The return value of #map is the collection transformed 

What if instruction is not for a transformation?
```ruby
[1, 2, 3].map do |num| 
    num.odd?
end                    => [true, false, true]
```
* map always performs transformations based on the return value of block
* In this case the return values will be a boolean

What about the return value of this?
```ruby
[1, 2, 3].map do |num| 
    num.odd? 
    puts num 
end
```
* Return value of the block will always be nil
* #map doesn’t care about truthiness, so takes the return value as transformation criteria
* collection returned by #map is a new array of nils
```ruby
irb :001 > [1, 2, 3].map do |num| 
irb :002 > num.odd? 
irb :003 > puts num 
irb :004 > end 
1 
2 
3 
=> [nil, nil, nil]
```
Example 9: More return values of #map
```ruby
[1, 2, 3].map do |num| 
    ‘hi'
end
```
* hi is the only statement within the block
* return value of the block is hi, which map will use as the transformation criteria
* will return an array where each element is hi
```ruby
irb :001 > [1, 2, 3].map do |num| 
irb :002 > 'hi’ 
irb :003 > end => ["hi", "hi", "hi"]
```
Example 10: Enumerables and what methods they are available to

* Array and Hash both have an each method
* #select and #map are defined in a module called Enumerables and made available to Array and Hash classes
* String doesn’t have access to Enumerables, but we can convert a string to an array by calling String#split

Summary of the three methods and their return value

Method  Action  Considers the return value of the block?    Returns a new collection from the method?   Length of the returned collection
each    Iteration   No  No, it returns the original     Length of original 
select  Selection   Yes, its truthiness     Yes     Length of original or less 
map Transformation  Yes     Yes     Length of original 