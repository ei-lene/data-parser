# Error message:
# hash_structure.rb:11:in `block in <main>': undefined local variable or method `lastname' for main:Object (NameError)
# from hash_structure.rb:7:in `each'
# from hash_structure.rb:7:in `<main>'

records = []

pipe_content = File.open('/Users/e/flatiron/Projects/data-parser/pipe.txt').readlines

pipe_content.each do |record|
 
  parts = record.split("|")
  
  lastname.to_sym = parts[0].strip
  firstname.to_sym = parts[1].strip   
  gender.to_sym = parts[3].strip
  favoritecolor.to_sym = parts[4].strip
  dob.to_sym = parts[5].strip

  records[lastname.to_sym] ||= []
  records[firstname.to_sym] ||= []
  records[middleinitial.to_sym] ||= []
  records[gender.to_sym] ||= []
  records[favoritecolor.to_sym] ||= []
  records[gender.to_sym] ||= []

end