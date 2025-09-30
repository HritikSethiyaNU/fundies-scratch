use context starter2024
# Naming Conventions 


#1
TriangleColour = "orange"
TriangleSideLen = 35
triangle(TriangleSideLen, "solid", TriangleColour)



# 2
SideLength = 35 
org = "orange"
square(SideLength, "solid", org)

#3
square(35, "solid", "orange")

#4
#SideLength = 45 
#The statement above is ruled out because of shadowing 

#5
circleSize = 25
circleColour = "yellow"
circ = circle(circleSize, "solid", circleColour)

rectangleLength = 140
rectangleWidth = 90
rectangleColour = "black"
rect = rectangle(rectangleLength, rectangleWidth, "solid", rectangleColour)

# Main Code Output Line 
above(circ, rect)

#6
DoubleCircle = beside(circ, circ)
above(DoubleCircle, rect)


#7

# Size
starSize = 15
smallRectWidth = 25
smallRectLength = 30
bigRectWidth = 50
bigRectLength = 70

#Colours
starColour = "white"
smallRectColour = "orange"
bigRectColour = "black"





# Shapes
star-design = star(starSize, "solid", starColour)
smallRect-design = rectangle(smallRectLength, smallRectWidth, "solid", smallRectColour)
bigRect-design = rectangle(bigRectLength, bigRectWidth, "solid", bigRectColour)

# Flag

small = overlay-align("center", "middle", star-design, smallRect-design)
overlay-align("left", "top", small, bigRect-design)




