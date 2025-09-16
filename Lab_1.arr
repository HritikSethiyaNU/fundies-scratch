use context starter2024

# 1

"Question - 1.1"
setup_cost = 3
fiveShirtCost = (5 * 12) + setup_cost
sevenShirtCost = (7 * 12) + setup_cost

fiveShirtCost > sevenShirtCost 

"Question - 1.2"
# This code writes finds the perimeter and multiplies it to the per perimeter cost 

height = 420
width = 594
perimeter  = 2 * (width + height)
perimeter * 0.10

# 2
"Question - 2.1"

"Designs for everyone!"

"Question - 2.2"

"red" + "blue"

"1 + blue does not work because it is addition between two different data types"

# 3
"Question - 3"

base = rectangle(60, 180, "solid", "black")

stop = circle(20, "solid", "red")
go = circle(20, "solid","green")
caution = circle(20, "solid","yellow")

#Using above to align the traffic singals properly
overlay_func1 = above(stop, caution)
overlay_function_final = above(overlay_func1, go)


#Using overlay - align to ceter the singals in the middle of the rectangular base 
overlay-align("center", "middle", overlay_function_final, base)

"Question - 4"

# Rectifying the rectangle code by positioning the x-y values 
rectangle(50, 20, "solid", "black")

# Rectifying the circle code with the use of quotes on either side of "solid"
circle(30, "solid", "red")



"Question - 5"

blueRectangle = rectangle(30, 35, "solid", "blue")
blackRectangle = rectangle(30, 35, "solid", "black")
whiteRectangle = rectangle(30, 35, "solid", "white")

#Flag
step1 = beside(blackRectangle, whiteRectangle)
beside(step1, blueRectangle)

#Shield
blackSquare = rotate(45, square(60, "solid", "black"))
blueSquare = rotate(45, square(55, "solid", "blue"))
whiteSquare = rotate(45, square(50, "solid", "white")) 

step2 = overlay(blueSquare, blackSquare)
Shield = overlay(whiteSquare, step2)

#Share + Label
overlay-align("center", "middle", text("OVO", 20, "black"), Shield)


