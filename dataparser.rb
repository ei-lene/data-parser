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

records = []
person = []

# Processing and reformatting records from pipe file
pipe_content = File.open('pipe.txt').readlines

pipe_content.each do |record|
  parts = record.split("|")
  person << parts[0].strip
  person << parts[1].strip
  person << parts[3].strip
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
  person << parts[2].strip
  person << parts[4].strip
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
  person << parts[3].strip
  person << parts[4].strip.gsub('-','/')
  person << parts[5].strip
  records << person
  person =[]
end

puts "printing records"
puts records
