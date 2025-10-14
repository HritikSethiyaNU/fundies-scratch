use context dcic2024
include image 
include csv
include data-source
# plan 

# Task 2

flights_53 = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: Number,
  tailnum :: String,
  origin :: String,
  dest :: String,
  air_time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time_hour :: String
  
  source: csv-table-file("flights_sample53.csv", default-options)
  sanitize rownames using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
  
  
end  
  
flights_54 = transform-column(flights_53, "tailnum",
  lam(t): if t == "": "UNKNOWN" else: t end
end)

# Step 2 - Replace negative delay values with 0
flights_55 = transform-column(flights_54, "dep_delay",
  lam(d): if d < 0: 0 else: d end
end)

flights_56 = transform-column(flights_55, "arr_delay",
  lam(d): if d < 0: 0 else: d end
  end)

# Step 3 - Identify Duplicates by Creating a dedup_key

#| Helper function to trim spaces
fun trim(s :: String) -> String:
  doc: "Remove spaces from the given string."
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s, " ", "")
  end
end
|#

# Task 3

fun trim(s :: String) -> String:
  n = string-length(s)
  if n == 0: 
    ""  
  else: 
    string-replace(s, " ", "") 
  end
end

fun code-airline(code :: String) -> String:
  c = string-to-upper(trim(code))
  if c == "UA": "United Airlines"
  else if c == "AA": "American Airlines"
  else if c == "B6": "JetBlue"
  else if c == "DL": "Delta Air Lines"
  else if c == "EV": "ExpressJet"
  else if c == "WN": "Southwest Airlines"
  else if c == "OO": "SkyWest Airlines"
  else: "Other"
  end
end

flights_57 =
  build-column(flights_56, "airline",
    lam(r): code-airline(r["carrier"]) end)

# --- 2) Filter outliers in distance and air_time ---
# Keep only rows with distance <= 5000 and air_time >= 500
# (i.e., drop distance > 5000 OR air_time < 500)

flights_58 = filter-with(flights_57,lam(r): (r["distance"] <= 5000) and (r["air_time"] >= 500) end)
flights_58