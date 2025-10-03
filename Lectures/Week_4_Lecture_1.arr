use context dcic2024

include csv 
include data-source 



#Problem 1
orders = table: time, amount 
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.0
where:
  is-high-value(orders.row-n(2)) is true
  is-high-value(orders.row-n(3)) is false
end 


fun is-morning(r :: Row) -> Boolean:
  doc: "Checking if it is a morning order ot not"
  if r["time"] < "12:00":
    true
  else:
    false
  end
end


#Creating a table with only morning orders 
morning-orders = filter-with(orders, is-morning)

"Morning Orders"
morning-orders


#Recreating the same with a unnamed function 

morning-orders2 = filter-with(orders, lam(r): r["time"] < "12:00" end)

"Morning orders list built with a unnames function"
morning-orders2

#Creating a table which sorts the orders from latest to earliest
order-by(orders, "time", false)

#Creating a list where the morning orders are sorted from latest to earliest and then extracting the first row_amount.
descend = order-by(morning-orders, "time", false)
descend.row-n(0)["amount"]

#Problem-2 - Loading a table from a url source, using a unnamed function to then filter out places that dont have forests

Places = load-table:
  Location :: String,
  Subject :: String,
  Date :: Date
  source: csv-table-url("https://pdi.run/f25-2000-photos.csv", default-options)
end
  
Forests = filter-with(Places, lam(x): x["Subject"] == "Forest" end)

descendDate = order-by(Forests, "Date", false)
descendDate.row-n(0)["Location"]


#2.3 - Creating a table where is stores the number of times each place is repeated  

photosCount = count(Places, "Location")

photosDescend = order-by(photosCount, "count", false)
photosDescend

# Creating a frequency bar chart 

placesAscend = order-by(Places, "Location", true)
freq-bar-chart(Places, "Location",)


  
    
  