use context dcic2024

include csv 
include data-source 



# Loading the entire Palmer Penguins dataset into the table "penguinData. Followed by sanitization to convert the numeric data in string to numbers"
PreClean-penguinData = load-table:
  species :: String,
  island :: String,
  bill_length :: Number,
  bill_depth :: Number,
  flipper_length :: Number,
  body_mass :: Number,
  sex :: String
  source: csv-table-file("penguins.csv", default-options)   
end 


# Cleaning the data to make sure that there are no descrepencies in the data, as noticed some data points as seen in the fourth row are of String Data type or are empty instead of having a integer value, these data points are thus invalid and can be erased to clean the dataset.


fun is-not-NA(o :: Row) -> Boolean:
  doc: "Cleaning the data to make sure all columns of data are present for each penguin"
  
  (o["bill_length"] <> "NA") and (o["bill_depth"] <> "NA") and (o["flipper_length"] <> "NA") and (o["body_mass"] <> "NA") and (o["sex"] <> "NA")
    end 

penguinData = filter-with(PreClean-penguinData, is-not-NA)


# Scalar Processing

#Changing all numberical data from Strings to Numbers 

fun to-num(str):
    doc: "Change the datatype of the inputted value from String to Number" 
    
  string-to-number(str)
end 

transform-column(penguinData, "bill_length", to-num)
transform-column(penguinData, "bill_depth", to-num)
transform-column(penguinData, "flipper_length", to-num)
transform-column(penguinData, "body_mass", to-num)
penguinData 


# Changing the values in bill_length, bill_depth and flpper_length from mm to cm 



