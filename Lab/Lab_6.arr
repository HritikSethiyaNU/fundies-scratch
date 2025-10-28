use context dcic2024
include data-source
include csv 
include lists


student_score =  load-table:
  Name :: String,
  Surname :: String,
  Email :: String,
  Score :: Number
  source: csv-table-file("students_gate_exam_score.csv", default-options)
    # Sanitizing Data from string values to number values 
  sanitize Score using num-sanitizer
end

#1.1 
student_score_desc = order-by(student_score, "Score", false)

"First Place"
student_score_desc.row-n(0)["Name"]
student_score_desc.row-n(0)["Surname"]
student_score_desc.row-n(0)["Score"]


"Second Place"
student_score_desc.row-n(1)["Name"]
student_score_desc.row-n(1)["Surname"]
student_score_desc.row-n(1)["Score"]

"Third Place"
student_score_desc.row-n(2)["Name"]
student_score_desc.row-n(2)["Surname"]
student_score_desc.row-n(2)["Score"]


#1.2

data Stduent:
  |student(name :: String, surname :: String, score :: Number)
end 


#1.3
s1 = student("Hritik", "Sethiya", 99)
s2 = student("Rithvik", "Nar", 90)
s3 = student("Yash","Punjabi", 70)


#1.4

scores :: List<Number> = link(s1.score, link(s2.score, link(s3.score, empty)))

fun ninty_plus(e :: List<Number>) -> Number:
  cases (List) e:
    | empty => 0
    | link(f, r) =>
      (if f >= 90: 1 else: 0 end) + ninty_plus(r)
  end
end


ninty_plus(scores)


#2.1

all-emails :: List<String> = student_score.get-column("Email")

#2.2
fun get-domain(str):
  part1 = string-split(str, "@")
  doc = part1.get(1)
  part2 = string-split(doc, ".")
  domain = part2.get(0)
  domain
end

uni-domain = map(get-domain, all-emails)

unique-universities = distinct(uni-domain)

unique-universities


#2.3

fun replace-domain(str):
  if string-split(str, "@").get(1) == "nulondon.ac.uk":
    string-replace(str, "nulondon.ac.uk", "northeastern.edu")
  else:
    str
end 

end
  
filtered-list = map(replace-domain, all-emails)
filtered-list