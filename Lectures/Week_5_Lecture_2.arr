use context starter2024

import math as M
import statistics as S 

discount-codes :: List<String> = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

# Operating Lists


# Question - 1
# Making sure all values in the list are unique 
unique-codes = distinct(discount-codes)

unique-codes 

# Question - 2 
# Changin all characters in each code to upper Case  

fun cleaner(code :: String) -> String:
  string-to-upper(code)
end 

real-codes = map(cleaner, unique-codes)
  
real-codes




# Question - 3
# Using a loop to compute the product of the elements in a list  

num-list :: List<Number> = [list: 12, 6, 10]

fun product(l1 :: List) block:
  var result = 1
  for each(item from l1):
    result := item * result
  end 
  result 
end 

product(num-list)

# Using a loop to compute the sum of even elements in a list  
    
fun sum-even(l2 :: List) block:
  var result2 = 0
  for each(item from l2):
    if num-modulo(item, 2) == 0:
      result2 := result2 + item
    else:
      result2 := 0 + item 
    end 
  end 
  result2
end 

sum-even(num-list)  
  

# Using a lopp to compute the length of the list 



fun my-length(l3 :: List) block:
  var len = 0
  for each(item from l3):
    if not(item == ""):
      len := 1 + len 
    else:
      len := len + 0
    end 
  end 
  len 
end 

my-length(num-list)


# Using a loop to compute a list with values that are double of each element in the original list 

fun my-doubles(numbers :: List<Number>) -> List<Number> block:
  doc: "doubles each number in a list"
  var doubled = [list: ]
  for each(n from numbers):
    doubled := doubled.append([list: n * 2])
  end
  doubled
where:
  my-doubles([list: 1, 2, 3]) is [list: 2, 4, 6]
end

# Using map to do double each element 

fun doubles(num :: Number) -> Number:
  num * 2
end
doubled-nums = map(doubles, num-list)

doubled-nums 


# Using a lopp to compute the lengths of the strings in a list and make a new list with the lengths of the correspoding place in the input list as the new element 


fun my-string-lens(og :: List<String>) -> List<Number> block:
  var len-list = [list: ]
  for each(item from og):
    len-list := len-list.append([list: string-length(item)])
  end 
  len-list
where:
  my-string-lens([list: "hi", "hello", "bye"]) is [list: 2, 5, 3]
end 
  

# Using map to do the same create another list which has a list of lengths of the input list 

fun my-string-lens-map(str :: String) -> Number:
  string-length(str)
end
str-lens = map(my-string-lens-map, [list: "hi", "hello", "bye"])

str-lens # Should be [list: 2, 5, 3]

# Using a lopp to create a list which stores every other element in a new list 

fun my-alternating(og-list :: List<Any>) -> List<Any> block:
    var new-list = [list: ]
    var tracker = 0
    for each(item from og-list) block:
      if num-modulo(tracker, 2) == 0 block:
        new-list := new-list.append(item)
        tracker := tracker + 1
      else:
        tracker := tracker + 1
      end
    end
    new-list
  end


alt-list = [list: "hi", "hello", "bye", "hola", "ciao"]

[list: "hi","bye", "ciao"]