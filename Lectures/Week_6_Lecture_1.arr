use context dcic2024
#|
data iphones: 
    phone(model :: String, cost :: Number, color :: String, storage :: Number)
end 

phone1 = phone("13 Pro", "Purple", 256)
phone2 = phone("17 Pro", "Orange", 64)

fun compute-cost(p :: MobileRecord) -> Number:
  doc: "Computes phone cost based on storage capacity"
  base-price = 500
  price-per-gb = 2
  base-price + (p.storage * price-per-gb)
 
where:
  compute-cost(iphone-1) is 628
  compute-cost(iphone-2) is 1524
end 

fun compute-cost-condition(p :: MobileRecord) -> Number:
  doc: "Compute phone cost based on storage, model, and color"
  
  #base price depends on model 
  base-price = if p.model == "13 Pro":
    799
  else if p.model == "14 Pro":
    999
  else if p.model == "17 Pro":
    699
  end 
  
  #Storage
  storage-cost = if p.storage <= 64:
    0
  else if p.storage <= 128:
    100
  else if p.storage <= 256:
    200
  else if p.storage <= 512:
    400
  else:
    600
  end
  
  #Color
  color-cost = if (p.color == "Orange") or (p.color == "Purple"):
    150
  else:
    0
  end 
  base-price + storage-cost + color-cost
where:
  compute-cost-condition(phone-1) is 799 + 0 + 0
  compute-cost-condition(phone-2) is 1399 + 400 + 150
  
end 

|#
data Priority:
  |low
  |medium
  |high
end 

task-1-priority = low
task-2-priority = high
task-3-priority = medium 

check:
  is-Priority(task-1-priority) is true 
  is-low(task-1-priority) is true 
  is-high(task-1-priority) is false 
end 

data Task:
  | task(description :: String, priority :: Priority)
  | note(description :: String)
end 

task-1 = task("Study for a exam", high)
task-2 = task("Wacth a series", low)
task-3 = task("Go for groceries", medium)

