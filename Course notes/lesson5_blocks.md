Lesson 5: Advanced Ruby Collections (Working with Blocks)

What are the questions asked when working with a block?
* What type of action is being performed? (method call, block, conditional, etc?)
* What is the object that action is being performed on?
* What’s the side effect of the action? Output vs. destructive action
* What’s the return value of the action?
* Is return value used by whatever instigated the action?

Example 1: Working with #each method

```ruby
[[1, 2], [3, 4]].each do |arr| 
    puts arr.first 
end
# 1# 3# => [[1, 2], [3, 4]]
```

What’s happening here?
* Array#each method is called on the multi-dimensional array 
* and each inner array is passed to block in turn, and assigned to local variable arr
* Array#first is called on arr, returns object at index 0 of current array, integers 1 and 3
* #puts method outputs string representation of integer
* #puts returns will, and since it’s the last evaluated statement in the block, return value of block is nil
* #each doesn’t do anything with returned value, since returned value of #each is the calling object, that’s returned

| Line      | Action                | Object                            | Side Effect                                   | Return Value                      | Is Return Value Used?                         |
|--------   |---------------------- |---------------------------------  |---------------------------------------------  |---------------------------------  |---------------------------------------------- |
| 1         | method call (#each)   | outer array                       | none                                          | calling object                    | no, but shown on line 6                       |
| 1 to 3    | each sub-array        | each sub-array                    | none                                          | nil                               | no                                            |
| 2         | method call (#first)  | each sub-array                    | none                                          | element at index 0 of sub-array   | yes, used by puts                             |
| 2         | method call (#puts)   | element at index 0 of sub-array   | outputs string representation of an integer   | nil                               | yes, used to determine return value of block  |

Example 2: #map method, return and output

```ruby
[[1, 2], [3, 4]].map do |arr| 
    puts arr.first 
end
# 1# 3# => [nil, nil]
```

| Line      | Action                | Object                            | Side Effect                                   | Return Value                      | Is Return Value Used?                         |
|--------   |---------------------- |---------------------------------  |---------------------------------------------  |---------------------------------  |---------------------------------------------- |
| 1         | method call (#map)    | outer array                       | none                                          | new array [nil, nil]              | no, but shown on line 6                       |
| 01-Mar    | each sub-array        | each sub-array                    | none                                          | nil                               | yes, used by #map for transformation          |
| 2         | method call (#first)  | each sub-array                    | none                                          | element at index 0 of sub-array   | yes, used by puts                             |
| 2         | method call (#puts)   | element at index 0 of sub-array   | outputs string representation of an integer   | nil                               | yes, used to determine return value of block  |

Example 3: Minding #map method and return vs. output values

```ruby
[[1, 2], [3, 4]].map do |arr| 
    puts arr.first 
    arr.first 
end
```
| Line      | Action                | Object                                | Side Effect                                   | Return Value                      | Is Return Value Used?                         |
|--------   |---------------------- |-------------------------------------- |---------------------------------------------  |---------------------------------  |---------------------------------------------- |
| 1         | method call (#map)    | outer array                           | none                                          | new array [1, 3]                  | no                                            |
| 01-Apr    | block execution       | each sub-array                        | none                                          | integer at index 0 of sub-array   | yes, used by #map for transformation          |
| 2         | method call (#first)  | each sub-array                        | none                                          | element at index 0 of sub-array   | yes, used by puts                             |
| 2         | method call (#puts)   | integer at index 0 of each sub-array  | outputs string representation of an integer   | nil                               | no                                            |
| 3         | method call (#first)  | each sub-array                        | none                                          | element at index 0 of sub-array   | yes, used to determine return value of block  |

Example 4: Working with nested arrays and nested #each methods
```ruby
my_arr = [[18, 7], [3, 12]].each do |arr| 
    arr.each do |num| 
        if num > 5 
        puts num 
        end 
    end
end
# 18# 7# 12# => [[18, 7], [3, 12]]
```

| Line      | Action                    | Object                                        | Side Effect                                       | Return Value                                          | Is Return Value Used?                                 |
|--------   |-----------------------    |--------------------------------------------   |-----------------------------------------------    |----------------------------------------------------   |----------------------------------------------------   |
| 1         | variable assignment       | n/a                                           | none                                              | [[18,7], [3, 12]]                                     | no                                                    |
| 1         | method call (#each)       | [[18,7], [3, 12]]                             | none                                              | calling object [[18,7], [3, 12]]                      | yes, used by variable assignment to my_arr            |
| 01-Jul    | outer block execution     | each sub-array                                | none                                              | each sub-array                                        | no                                                    |
| 2         | method call (#each)       | each sub-array                                | none                                              | the calling object: sub-array in current iteration    | yes, used to determine return value of outer block    |
| 02-Jun    | inner block execution     | element of the sub-array in that iteration    | none                                              | nil                                                   | no                                                    |
| 3         | comparison (>)            | element of the sub-array in that iteration    | none                                              | Boolean                                               | yes, evaluated by if                                  |
| 03-May    | conditional (if)          | element of the sub-array in that iteration    | none                                              | nil                                                   | yes, used to determine return value of inner block    |
| 4         | method call (#put)        | element of the sub-array in that iteration    | outputs a string representation of an integer     | nil                                                   | yes, used to determine return value of inner block    |

Example 5: Working with #map method

```ruby
[[1, 2], [3, 4]].map do |arr| 
    arr.map do |num| 
        num * 2 
    end
end
```

| Line      | Action                    | Object                            | Side Effect   | Return Value              | Is Return Value Used?                                 |
|--------   |-----------------------    |-------------------------------    |-------------  |-----------------------    |----------------------------------------------------   |
| 1         | method call (#map)        | [[1,2], [3, 3]]                   | none          | new transformed array     | no                                                    |
| 01-May    | outer block execution     | each sub-array                    | none          | new transformed array     | yes, used by top level map for transformation         |
| 2         | method call (#map)        | each sub-array                    | none          | new transformed array     | yes, used to determine outer block’s return value     |
| 02-Apr    | inner block execution     | element within each sub-array     | none          | an integer                | yes, used by inner map for transformation             |
| 3         | num * 2                   | n/a                               | none          | an integer                | yes, used to determine return value of inner block    |

Example 6: Working with key-value pairs in a hash

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash| 
    hash.all? do |key, value| 
        value[0] == key.to_s 
    end
end
# => [{ :c => "cat" }]
```

| Line      | Action                                            | Object                                            | Side Effect                                   | Return Value                                      | Is Return Value Used?                                 |
|--------   |------------------------------------------------   |------------------------------------------------   |--------------------------------------------   |-------------------------------------------------  |---------------------------------------------------    |
| 1         | method call (#select)                             | original hash                                     | none                                          | each hash pair passed into the block              | no                                                    |
| 01-May    | outer block execution                             | each key-value pair                               | none                                          | new array with key-value pair that returns true   | yes, used by top level select for selection           |
| 2         | method call (#all?)                               | each key-value pair of the hash                   | none                                          | boolean true/false                                | yes, used to determine outer block’s return value     |
| 3         | whether first index of value equals to the key    | hash key-value pair that’s being iterated over    | yes, boolean value returned to outer block    | boolean                                           | yes, used by inner block                              |

Example 7: Sorting numeric strings

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9’]]
arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]
```

* This array contains numeric strings
* But we want to sort the string based on their numeric values
* We need to sort the outer level of the array, but can’t just call #sort
* There are two sets of comparisons: 1) each inner array is compared to other inner arrays, 2) arrays are compared by comparing elements within them
* Elements in the arrays are strings, calling sort it’s string order which will determine array order
* Since strings are compared character by character, need to perform transformation on the inner array

```ruby
arr.sort_by do |sub_arr| 
    sub_arr.map do |num| 
        num.to_i 
    end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```

* With #sort_by, transformed elements are what are used to perform the comparison
* As long as what’s returned by the block is comparable, can perform transformation on the block, including nesting and other methods within it
* Each time the top level block is called, call #map on the sub-array for that iteration, within the #map block, call to_i on each string within the sub-array, returns new array with integers, and leaves the original sub-array unmodified
* Ends up sorting the outer array by comparing transformed integers in the inner arrays, without any side effects

```ruby
%w{apple pear fig}.sort_by { |word| word.length}
#=> ["fig", "pear", "apple"]
```

Example 8: Select integers greater than 13 but strings less than 6 characters
```ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr| 
    arr.select do |item| 
        if item.to_s.to_i == item # if it's an integer 
            item > 13 
        else 
            item.size < 6 
        end 
    end
end
# => [[27], ["apple"]]
```

* First instinct would be to reach for the #select method, but with a nested array it won’t work
* Instead, need to access the nested array so we can select the value we want
* In order to select the specified values, need to determine if element is integer, .to_s.to_i == item is a way to do it
* #map is used instead of #each, because it can not only iterate over the array and access nested arrays, but also return a new array containing the selected values
* #each would require us to have an additional variable to catch the desired values

Example 9: Methods and return values (3+3)

```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1| 
    element1.each do |element2| 
        element2.partition do |element3| 
            element3.size > 0 
        end 
    end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
```
“ The key things to focus on with this example is understanding how each method works and the return value of the block. There are a total of 6 return values since there are 3 methods and 3 blocks (that is, ignoring the return value of this expression: element3.size > 0). By looking at the example, you should notice the first method call within map is each. If we understand each, we know that it doesn't care about the block's return value and it always returns the calling object. Therefore, just by looking at line 2, we can already say that the return value of map will be a new array that matches the value of the calling object. In this example, that's really all the interesting behavior there is as there are no side effects deeper in the code. ” 

* On a side note, #partition returns two arrays, first containing elements of enum for which the block evaluates to be true, the second containing the rest

`(1..6).partition { |v| v.even? }  #=> [[2, 4, 6], [1, 3, 5]]`

Example 10: 
```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr| 
    arr.map do |el| 
        if el.to_s.size == 1 # it's an integer 
            el + 1 
        else # it's an array 
            el.map do |n| 
                n + 1 
            end 
        end 
    end
end
# => [[[2, 3], [4, 5]], [6, 7]]
```
* Original array had uneven nested levels, so if we want to add 1 to every value, need to find  way to access these values
* Must first determine if the current array is an array or integer
* # is good since it returns new array containing transformed values

Example 11: 

Do not mutate while iterating:
```ruby
arr = [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]
    arr.map do |arr2| 
        arr.pop 
end
```
