use context dcic2024



# Question 1 
# Part a

fun km-to-miles(km :: Number) -> Number:
  
  doc:"It takes in a distance in kilometers and converts it to its miles equivalent"
  
  km / 1.6
  
where:
  km-to-miles(10) is 6.25
  km-to-miles(50) is 31.25
end

# Part b 

fun aqi-category-finder(aqi :: Number) -> String:
  
  doc:"Matches the aqi number inputted to the category it belongs to"
  
  if (aqi >= 0) and (aqi <= 50):
    "Good"
  else if (aqi >= 51) and (aqi <= 100):
    "Moderate"
  else if (aqi >= 101) and (aqi <= 150):
    "Unhealthy"
  else:
    "Hazardous"
end 

where:
  aqi-category-finder(15) is "Good"
  aqi-category-finder(128) is "Unhealthy"
end 


# Question - 2

# Part a

basket = table: 
  item :: String, 
  price :: Number, 
  quantity :: Number
  
  row: "apple", 0.50, 10
  row: "orange", 0.75, 5
  row: "watermelon", 2.99, 2
end

fun add-total(bask:: Table) -> Table:
  
  doc:"It takes in the basket table and adds a new column to it called total where it multiplies the price and quantity of items"
  
  new-basket = build-column(bask, "total", lam(r): (r["price"] * r["quantity"]) end)
  
  new-basket
  
end

new-basket = add-total(basket)

final-basket = order-by(new-basket, "total", false)

final-basket.row-n(0)["item"]

