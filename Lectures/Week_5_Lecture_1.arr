use context dcic2024

# Q1: Identify and Correct Bad Data in County Column


include data-source
include csv

# Loading the dataset
voters = load-table: 
  
  VoterID :: String,
  DOB :: String,
  Party :: string,
  Address :: String,
  City :: String,
  County :: String,
  Postcode :: String
  
  source: csv-table-file("voters.csv", default-options)
  
    
end

fun blank-to-undecided(s :: String) -> String:
  doc: "replaces an empty string with Undecided"
  if s == "":
    "Undecided"
  else:
    s
  end
where:
  blank-to-undecided("") is "Undecided"
  blank-to-undecided("blah") is "blah"
end

undecided-voters = transform-column(voters, "Party", blank-to-undecided)


undecided-voters

# Q2: Design a function normalize-date


# Plan:
# 1. Input: A date string in "DD/MM/YYYY" format
# 2. Output: A string in ISO format "YYYY-MM-DD"
# 3. Steps:
#    - Split the date by "/"
#    - Reorder parts as [year, month, day]
#    - Join with "-" as separator

fun normalize-date(date :: String) -> String:
  parts = string-split(date, "/")
  day = list.item(parts, 0)
  month = list.item(parts, 1)
  year = list.item(parts, 2)
  year + "-" + month + "-" + day
where: 
  normalize-date("23/04/2001") is "2001-04-23"
end 


# Apply normalize-date to the DOB column
#|
normalized-voters = auto-cleaned.map(lam(r):
  r { "DOB": normalize-date(r["DOB"]) }
end)

# Show normalized DOB column
normalized-voters["DOB"]

|#
