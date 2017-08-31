class Presidents::CLI #gives Presidents module access to the methods of the CLI class
 def call
  Presidents::Scraper.new.make_presidents
  #instantiates a new Scraper instance and calls make_presidents on it
  puts ""   #displays blank space and makes a new line
  puts "Welcome to the Presidents of the United States!"  #greets the user
  puts ""   #displays blank space and makes a new line
  start
 end

 def start
  print_presidents #calls the print_presidents method, displaying the list of presidents
  puts ""    #displays blank space and makes a new line
  puts "Which president would you like more information on?" #prompts user
  input = gets.strip
  #gets method retrieves the text that was last typed in
  #.strip removes new lines and whitespace; return value is set to a variable (input)
  president = Presidents::President.find(input.to_i)
  #input is converted to an integer by .to_i and passed as an argument to .find
  #.find retrieves and returns the requested President object and sets it equal to a variable (president)
  print_president(president) #displays the requested president
  puts "Would you like to see another president? Enter Y or N" #prompts user
  input = gets.strip.downcase #downcase converts uppercase to lowercase
  if input == "y"
   start
  else
   puts "Thank you! Have a nice day!" #displays farewell if the user answered "N"
   exit #exits the application
  end
 end
 def print_president(president)
   puts "----------- #{president.name} -----------"    #interpolates name attribute
   puts "Historical Documents: #{president.documents}" #..documents attribute
   puts "#{president.salary}"             #..salary attribute
   puts "#{president.vp}"                #..vp attribute
   puts ""  #displays blank space and starts a new line
 end

 def print_presidents
   #iterates over the @@all array and passes two arguments into the block
   Presidents::President.all.each_with_index do |president, index| #
     puts "#{index + 1}. #{president.name}" #displays each president by index number (+1)
   end
 end
end
