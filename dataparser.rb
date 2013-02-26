# Write a Ruby program to first assemble a single set of records by parsing data from 3 different file formats and then display these records sorted in 3 different ways.

# INPUT DATA

# A record consists of the following 5 fields: last name, first name, gender, date of birth and favorite color. You will be given 3 files, each containing records stored in a different format.

# The pipe-delimited file lists each record as follows:
# LastName | FirstName | MiddleInitial | Gender | FavoriteColor | DateOfBirth

# The comma-delimited file looks like this:
# LastName, FirstName, Gender, FavoriteColor, DateOfBirth

# The space-delimited file looks like this:
# LastName FirstName MiddleInitial Gender DateOfBirth FavoriteColor

# You may assume that the delimiters (commas, pipes and spaces) do not appear anywhere in the data values themselves. Write a Ruby program to read in records from these files and combine them into a single set of records.


# DISPLAY REQUIREMENTS
# Create and display 3 different views of the recordset (see a sample):
# Output 1 – sorted by gender (females before males) then by last name ascending.
# Output 2 – sorted by birth date, ascending.
# Output 3 – sorted by last name, descending.
# Ensure that fields are displayed in the following order: last name, first name, gender, date of birth, favorite color.
# Display dates in the format MM/DD/YYYY.

### EXTRACTING RECORDS ###
records = []
person = []

# Processing and reformatting records from pipe file
pipe_content = File.open('pipe.txt').readlines

pipe_content.each do |record|
  parts = record.split("|")
  person << parts[0].strip
  person << parts[1].strip
  if parts[3].strip.downcase.split("").first.eql?("f")
    person << "Female"
  else
    person << "Male"
  end
  person << parts[5].strip.gsub('-','/')
  person << parts[4].strip
  records << person
  person =[]
end


# Processing and reformatting records from comma file
comma_content = File.open('comma.txt').readlines

comma_content.each do |record|
  parts = record.split(",")
  person << parts[0].strip
  person << parts[1].strip
  if parts[2].strip.downcase.split("").first.eql?("f")
    person << "Female"
  else
    person << "Male"
  end
  person << parts[4].strip.gsub('-','/')
  person << parts[3].strip
  records << person
  person =[]
end


# Processing and reformatting records from space file
space_content = File.open('space.txt').readlines

space_content.each do |record|
  parts = record.split
  person << parts[0].strip
  person << parts[1].strip
  if parts[3].strip.downcase.split("").first.eql?("f")
    person << "Female"
  else
    person << "Male"
  end
  person << parts[4].strip.gsub('-','/')
  person << parts[5].strip
  records << person
  person =[]
end


### PREPARING OUTPUT ###
# Output 1 – sorted by gender (females before males) then by last name ascending.
females = []
males = []
final_output1 = []
records.each do |record|
  if record[2].downcase == "female"
    females << record
  else
    males << record
  end
end

females_sorted = females.sort_by{|record| record[0]}
males_sorted = males.sort_by{|record| record[0]}

females_sorted.each do |record|
  final_output1 << record.join(" ")
end 

males_sorted.each do |record|
  final_output1 << record.join(" ")
end 

# Output 2 – sorted by birth date, ascending.
output2 = []
final_output2 = []

output2 = records.sort_by{|record| record[3].split('/').last}
output2.each do |record|
  final_output2 << record.join(" ")
end 

# Output 3 – sorted by last name, descending.
output3 = []
final_output3 = []

output3 = records.sort_by{|record| record[0]}.reverse
output3.each do |record|
  final_output3 << record.join(" ")
end

### PRINTING OUTPUT TO CONSOLE ###
puts "Output1"
puts final_output1
puts "\n"

puts "Output2"
puts final_output2
puts "\n"

puts "Output3"
puts final_output3


### WRITING OUTPUT TO TEXT FILE ###

# Formatting output for text file
final_output1 = final_output1.join("\n  ")
final_output2 = final_output2.join("\n  ")
final_output3 = final_output3.join("\n  ")

File.new("output.txt","w+")

content = <<-RUBY


  Output 1:
  #{final_output1}

  Output 2:
  #{final_output2}

  Output 3:
  #{final_output3}

RUBY

File.open("output.txt","w+") do |f|
  f.puts(content)
end