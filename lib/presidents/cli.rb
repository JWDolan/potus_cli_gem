class Presidents::CLI #gives Presidents module access to the methods of the CLI class
 def call
  Presidents::Scraper.new.make_presidents
  #instantiates a new Scraper instance and calls make_presidents on it
  puts ""   #displays blank space and makes a new line
  puts "Welcome to the Presidents of the United States!"  #greets the user
  puts ""   #displays blank space and makes a new line
  start
 end
end
