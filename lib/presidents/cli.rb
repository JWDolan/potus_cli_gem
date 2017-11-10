class Presidents::CLI #gives Presidents module access to the methods of the CLI class
 def call
  Presidents::Scraper.new.make_presidents
  puts ""   
  puts "Welcome to the Presidents of the United States!"
  puts ""
  start
 end

 def start
  print_presidents 
  puts ""    
  puts "Which president would you like more information on?" 
  input = gets.strip
  
  president = Presidents::President.find(input.to_i)
  
  print_president(president) 
  puts "Would you like to see another president? Enter Y or N" 
  input = gets.strip.downcase 
  if input == "y"
   start
  else
   puts "Thank you! Have a nice day!" 
   exit 
  end
 end

 def print_president(president)
   puts "----------- #{president.name} -----------"    
   puts "#{president.vp}"                
   puts ""
   puts "Cabinet: #{president.cabinet}"        
   puts ""
   puts "Historical Documents: #{president.documents}" 
   puts ""
   puts "Notable Events: #{president.notable_events}"    
   puts "Points of Interest: #{president.points_of_interest}" 
   puts ""  
 end

 def print_presidents
   Presidents::President.all.each_with_index do |president, index| #
     puts "#{index + 1}. #{president.name}" 
   end
 end
end
