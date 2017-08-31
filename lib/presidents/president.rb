class Presidents::President #gives Presidents module access to the President class
 attr_accessor :name, :url, :documents, :salary, :vp
#defines getter,setter methods for every attribute of each President instance
 @@all = [] #sets class variable (@@all) to an empty array

  def self.new_from_index_page(r) #class method that accepts an argument
    self.new(#calls initialize method with two attributes as arguments (name, url)
      r.css("a").text, #retrieves node containing the president's name and converts it to text using .text
      "http://www.ipl.org/div/potus/#{r.css("a").attribute("href").text}" #interpolates link text at the end of the URL
      )
  end
end