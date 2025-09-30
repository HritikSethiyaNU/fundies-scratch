use context dcic2024
include csv 
include data-source

#problem 1
fun leapYearChk(year :: Number) -> Boolean:
  doc: "Fucntion is used to check if the inputted number is a leap year or not"
  
  if num-modulo(year, 4) == 0:
    true
  else:
    false
  end

where:

  leapYearChk(2016) is true
  leapYearChk(2025) is false
  leapYearChk(2020) is true

end 

#Problem 2
fun tick(numb :: Number) -> Number:

  
  doc: "The function is used to validate if a number is a whole number from 0 to 59"
  
  
  if (numb <= 59) and (numb >= 0) and (num-is-integer(numb) == true):
    numb + 1
  
  else:
    -1
    
  end
      
where:

  tick(16) is 17
  tick(2025) is -1
  tick(20) is 21

end

#Problem 3 

fun rock-paper-scissors(player1 :: String, player2 :: String) -> String:
  
  doc: "Classical game of rock-paper-scissors"
  
  if (player1 == "rock") and (player2 == "scissors"):
    "player1"
    
  else if (player1 == "scissors") and (player2 == "paper"):
    "player1"
   
  else if (player1 == "paper") and (player2 == "rock"):
    "player1"
    
  else if (player2 == "rock") and (player1 == "scissors"):
      "player2"
    
  else if (player2 == "scissors") and (player1 == "paper"):
      "player2"
   
  else if (player2 == "paper") and (player1 == "rock"):
      "player2"
      
  else if (player2 == "paper") and (player1 == "paper"):
    "tie"
    
  else if (player2 == "rock") and (player1 == "rock"):
    "tie"
    
  else if (player2 == "scissors") and (player1 == "scissors"):
    "tie"
    
  else:
    "Invalid choice"
  end
  
where:
  
  rock-paper-scissors("rock", "paper") is "player2"
  rock-paper-scissors("paper", "rock") is "player1"
  rock-paper-scissors("rock", "rock") is "tie"


end

#Problem 4

planet = table: Planet, Distance
  row: "Mercury", 0.39
  row: "Venus", 0.72
  row: "Earth", 1
  row: "Mars", 1.52
  row: "Jupiter", 5.2
  row: "Staurn", 9.54
  row: "Uranus", 19.2
  row: "Neptune", 30.06
end


#Extracting the third row from the table - "planet"
mars = planet.row-n(3)

#Extracting the distance from the variable - "Distance" 
mars["Distance"]


#Problem 5
something =  load-table:
  year :: Number,
  day :: Number,
  month :: String,
  rate :: Number
  source: csv-table-file("boe_rates.csv", default-options)
    # Sanitizing Data from string values to number values 
  sanitize year using num-sanitizer
  sanitize day using num-sanitizer
  sanitize rate using num-sanitizer
    
end

#Row Length 

something.length()

#Median and Mode
"Median"
median(something, "rate")

"Mode"
modes(something, "rate")

#Ascending and descending order
"Lowest rate:"
ascend = order-by(something, "rate", true)
ascend.row-n(0)["rate"]


"Highest rate:"
descend = order-by(something, "rate", false)
descend.row-n(0)["rate"]

  
  
  








  

    
  
  




  




  