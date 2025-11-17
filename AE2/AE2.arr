use context dcic2024

include csv
include data-source
import statistics as s

# Loading the table into the variable penguinData and santizing the numerical data, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, to Number data-type 

penguinData = load-table:
  PNo:: Number,
  species :: String,
  island :: String,
  bill_length_mm :: Number,
  bill_depth_mm :: Number, 
  flipper_length_mm :: Number, 
  body_mass_g :: Number,
  sex :: String,
  year :: Number 
  
  source: csv-table-file("penguins.csv", default-options)
  sanitize bill_length_mm using num-sanitizer 
  sanitize bill_depth_mm using num-sanitizer 
  sanitize flipper_length_mm using num-sanitizer 
  sanitize body_mass_g using num-sanitizer 
end 
penguinData


# Scalar Processing 

# Checking Environmental suitability, and hence classifying wehter a penguins body masss is above the antarctic survival threshold

fun env-suitable(mass :: Number) -> Boolean:
  
  doc: "Checks if the body mass of the penguin is above 3500 and reuturns if it is suitable for the weather conditions or not"
  
  mass >= 3500
  
where:
    env-suitable(3800) is true # from row: 1
    env-suitable(3200) is false # from row: 7
    env-suitable(4400) is true # from row: 14
 
end


env-suitablity = map(env-suitable, penguinData.get-column("body_mass_g"))


#Adding the new coloumn to a new table so that the data can be called easily, and differentiated whenever from the old data

penguinData-envChecked = penguinData.add-column("Env-Suitable", env-suitablity)


#Transformation 


# Calculating the bill volume of each penguin 


fun bill-volume(r :: Row) -> Number:
  doc: "Finding bill-volume by mulitiplying 0.5 to the product of bill length and bill depth"

  (r["bill_depth_mm"]) * (r["bill_length_mm"]) * 0.5

  
where:
  bill-volume(penguinData.row-n(4)) is 404.79
  bill-volume(penguinData.row-n(207)) is 317.615
  bill-volume(penguinData.row-n(300)) is 399
end

penguinData-with-billVol = build-column(penguinData-envChecked, "Bill Volume", bill-volume)

# Selection 

# Selecting Elite swimmer based on: filtering penguins with flipper length > 205 mm and body mass > 4500g 

  
elitePenguinData = filter-with(penguinData, lam(x): if (x["flipper_length_mm"] > 205) and (x["body_mass_g"] > 4500): true else: false end end)

elitePenguinData

# Selection - 2

# Identifying sexual dimorphism outliers 


# Making a new table for each species of penguins in the dataset 
GentooPenguins = filter-with(penguinData, lam(o): o["species"] == "Gentoo" end)
ChinstrapPenguins = filter-with(penguinData, lam(o): o["species"] == "Chinstrap" end)
AdeliePenguins = filter-with(penguinData, lam(o): o["species"] == "Adelie" end)


# Finding the species average body mass of the penguins 
GentooPenguins-mass = extract body_mass_g from GentooPenguins end

GentooPenguins-mass-avg = s.mean(GentooPenguins-mass)

ChinstrapPenguins-mass = extract body_mass_g from ChinstrapPenguins end

ChinstrapPenguins-mass-avg = s.mean(ChinstrapPenguins-mass)


AdeliePenguins-mass = extract body_mass_g from AdeliePenguins end

AdeliePenguins-mass-avg = s.mean(AdeliePenguins-mass)



#Identifying Sexual Dimorphism Outliers -> Selecting penguins whose body mass is 15% above the species average

fun SD-outliers(r :: Row) -> Boolean:
  doc: "Checking is the body mass of the penguins is greater by 15% above thier species average body mass"
  
  if (r["species"] == "Gentoo") and (r["body_mass_g"] >= (1.15 * GentooPenguins-mass-avg)):
    true 
  
  else if (r["species"] == "Chinstrap") and (r["body_mass_g"] >= (1.15 * ChinstrapPenguins-mass-avg)):
    true
  
  else if (r["species"] == "Adelie") and (r["body_mass_g"] >= (1.15 * AdeliePenguins-mass-avg)):
    true 
    
  else:
    false
  end
where:
  SD-outliers(penguinData.row-n(6)) is true
  SD-outliers(penguinData.row-n(115)) is false
  SD-outliers(penguinData.row-n(45)) is true
end 


# Using filter-with to make a new table of all sexual dismorphism outliers 
Sexual-Dismorphism-Outliers = filter-with(penguinData, SD-outliers)
Sexual-Dismorphism-Outliers


# Accumulation 