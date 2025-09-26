use context starter2024


#1 Using If/ ElseIf 
#|
fun choose-hat(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat and below 10C a winter hat"
 
  if temp-in-C >= 27:
    "sun hat"
  else if temp-in-C <= 9:
    "winter hat"
  else:
    "no hat"
  end

where:
  choose-hat(25) is "no hat"
  choose-hat(32) is "sun hat"
  choose-hat(27) is "sun hat"
  choose-hat(8) is "winter hat"

end
|#
# 2 Using ASK 


fun choose-hat(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat and below 10C a winter hat"
 
  ask:
    | temp-in-C >= 27 then: "sun hat"
    | temp-in-C <= 9 then: "winter hat"
    | otherwise: "no hat"
  end 
  
where:
  choose-hat(25) is "no hat"
  choose-hat(32) is "sun hat"
  choose-hat(27) is "sun hat"
  choose-hat(8) is "winter hat"

end


#3 ADD- glasses function 

fun add-glasses(outfit :: String) -> String:
  doc: "Adds the string ', and glasses' whenever called"
  
  outfit + ", and glasses"

end 


#4 Choose Outfit function 


fun choose-outfit(temp-in-C :: Number) -> String:
  
  doc: "Adds glasses and a sun hat to temperatures above 27C and a winter hat with no glasses if below 9C"
  
  if temp-in-C >= 27:
    item = choose-hat(temp-in-C)
    add-glasses(item)
  else if temp-in-C <= 9:
    choose-hat(temp-in-C)
  else:
    choose-hat(temp-in-C)
  end
  
end

#4 Coose Hat Or Visor Function 

fun choose-hat-or-visor(temp-in-C :: Number, has-visor :: Boolean) -> String:
  doc: "Checks if the person needs a visor or a hat"
  
  
  if (has-visor == true) and (temp-in-C >= 30):
    "Visor"
  else:
      choose-hat(temp-in-C)
  end
  
end 


choose-hat-or-visor(45, false)


# Create a function and enter the marks and based on the condition output the grade  


fun Grader(mark :: Number) -> String:
  doc: "Takes the student's mark as input and outputs his grade depending on his result"
  
  
  if mark >= 70:
    "A"
  else if mark >= 60:
    "B"
  else if mark >= 50:
    "C"
  else:
    "F"
  end 
  
end 

Grader(67)


