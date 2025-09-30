use context starter2024

#  Loading CSV from a URL
include csv 
include data-source



table = load-table:
  colA :: String,
  colB :: Number,
  colC :: Number,
  colD :: String,
  colE :: String,
  colF :: Number,
  colG :: String 
  
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)

end

#Fetching table Length - 100
table.length()

#False row number - Row-n too large error
#table.row-n(101)


# 2 - Loading CSV from File 

table2 = load-table:
  col1 :: Number,
  col2 :: Number,
  col3 :: String,
  col4 :: Number,
  col5 :: Number,
  col6 :: Number
  
  # Unzipped/Extracted the csv file and uploaded onto vs-code
  source: csv-table-file("glucose_levels.csv", default-options)
    
    # Changing the numerical string data into the 'Number' data type
  sanitize col1 using num-sanitizer
  sanitize col2 using num-sanitizer
  sanitize col4 using num-sanitizer
  sanitize col5 using num-sanitizer
  sanitize col6 using num-sanitizer

end

# summerizing, finding mean, mode and median to create a better understanding of the data on the file - glucose_levels.csv

#|
sum(table2, "col2")
mean(table2, "col2")
median(table2, "col2")
modes(table2, "col2")
lr-plot(table2, "col2", "col3")
|#