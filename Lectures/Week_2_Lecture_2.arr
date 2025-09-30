use context starter2024

#|
   Function Design Process 1
|#

#1.1
(4 * 5) + (string-length("Go Team!") * 0.10)


#1.2
(7 * 5) + (string-length("Hello World") * 0.10)

#1.3 - 1.5

fun tshirt_cost(NoOfShirts :: Number, NoOfCharacters :: String) -> Number:
  
  doc: "Takes the number of shirts (then multiplies it to 5) and the number of characters (then multiplies it to 0.10) and then adds and finds the total cost"
  
  (NoOfShirts * 5) + (string-length(NoOfCharacters) * 0.10)
  
end

#1.6
tshirt_cost(10, "Northeastern UNiversity London")


#|
   Function Design Process 2
|#


#2.1-2.2

fun celsius-to-fahrenheit(CelciusTemp):
  
  doc: "Deriving the magnitude of temperature in Fahrenheit from Celcius"
  
  ((CelciusTemp) * (9/5)) + (32)
  
end

#2.3

fun fahrenheit-to-celsius(FahrenheitTemp):
  
  doc: "Deriving the magnitude of temperature in Celcius from Fahrenheit"
  
  (FahrenheitTemp - 32) * (5/9)
  
end


#2.4 - 2.5

check:
  
  celsius-to-fahrenheit(0) is 32
  fahrenheit-to-celsius(32) is 0
  fahrenheit-to-celsius(57.2) is 14
  celsius-to-fahrenheit(14) is 57.2
  
end



#|
   Function Design Process 3
 
|#



fun TriColourVerticleFlag(clr1 :: String, clr2 :: String, clr3 :: String) -> Image:
  
  blueRectangle = rectangle(30, 35, "solid", clr1)
  blackRectangle = rectangle(30, 35, "solid", clr2)
  whiteRectangle = rectangle(30, 35, "solid", clr3)

  #Flag
  step1 = beside(blackRectangle, whiteRectangle)
  beside(step1, blueRectangle)

  
end

TriColourVerticleFlag("blue", "white", "black")


