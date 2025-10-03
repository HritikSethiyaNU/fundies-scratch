use context dcic2024
include data-source
include csv 

items = table: 
  item :: String, 
  x-coordinate :: Number, 
  y-coordinate :: Number
  
  row: "Sword of Dawn",           23,  -87
  row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           78,  -56
  row: "Magic Staff",             -9,   64
  row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  -66,    5
  row: "Ring of Fire",            38,  -92
  row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          -29,  -21
end

fun subtract-1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  subtract-1(10) is 9
  subtract-1(0) is -1
  subtract-1(-3.5) is -4.5
end

# Example: moving all x-coordinates left by 1
moved-items = transform-column(items, "x-coordinate", subtract-1)

fun pull-closer(n :: Number) -> Number:
  doc: "multiplies coordinates by 0.9 to pull 10% closer to origin"
  n * 0.9
where:
  pull-closer(10) is 9
  pull-closer(-20) is -18
  pull-closer(0) is 0  
end 

# Using transformation to change both x and y coordinates
items-pulled-closer =
  transform-column(
    transform-column(items, "x-coordinate", pull-closer),
    "y-coordinate", pull-closer)


#

fun calc-distance(r :: Row) -> Number:
  doc: "calculates distance from origin and converts to rational"
  
  num-to-rational(num-sqr(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"])))



# 3 - Obfuscate 

fun obfuscate(name :: String) -> String:
  string-repeat("X", string-length(name))
end 

obfuscate-items = transform-column(items, "item", obfuscate)


#4 Computing columns for a CSV


ConsPrice = load-table:
  Code :: String,
  Indicies :: String,
  Aug-24 :: Number,
  Sep-24 :: Number,
  Oct-24 :: Number,
  Nov-24 :: Number,
  Dec-24 :: Number,
  Jan-25 :: Number,
  Feb-25 :: Number,
  Mar-25 :: Number,
  Apr-25 :: Number,
  May-25 :: Number,
  Jun-25 :: Number,
  Jul-25 :: Number,
  Aug-25 :: Number
  
  sanitize Aug-24 using num-sanitizer
  sanitize Sep-24 using num-sanitizer
  sanitize Oct-24 using num-sanitizer
  sanitize Nov-24 using num-sanitizer
  sanitize Dec-24 using num-sanitizer   sanitize Jan-25 using num-sanitizer
  sanitize Feb-25 using num-sanitizer
  sanitize Mar-25 using num-sanitizer
  sanitize Apr-25 using num-sanitizer
  sanitize May-25 using num-sanitizer
  sanitize Jun-25 using num-sanitizer
  sanitize Jul-25 using num-sanitizer
  sanitize Jun-25 using num-sanitizer
  sanitize Jun-25 using num-sanitizer
    
      
      