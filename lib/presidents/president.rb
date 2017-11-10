class Presidents::President #gives Presidents module access to the President class
 attr_accessor :name, :url, :documents, :vp, :cabinet, :notable_events, :points_of_interest
#defines getter,setter methods for every attribute of each President instance
 @@all = [] #sets class variable (@@all) to an empty array

  def self.new_from_index_page(r) #class method that accepts an argument
    self.new(#calls initialize method with two attributes as arguments (name, url)
      r.css("a").text, #retrieves node containing the president's name and converts it to text using .text
      "http://www.ipl.org/div/potus/#{r.css("a").attribute("href").text}" #interpolates link text at the end of the URL
      )
  end
#instantiates new instance with name, url arguments (default value is nil for both)
  def initialize(name=nil, url=nil)
    @name = name  #sets name argument to an instance variable
    @url = url    #sets url argument to an instance variable
    @@all << self   #shovel operator adds the instance to the @@all array
  end

  def self.all  #returns all instances of the President class
    @@all  #returns an array of President instances
  end

  def self.find(id) #accepts an argument and finds the instance with index = argument - 1
    self.all[id - 1]
  end


  #||= assigns AND returns the value of the instance variable
  #.xpath accepts a selector as an argument and retrieves all matching elements; .text converts them to text
  #SELECTORS: td = table data cell, dl = description list, dt = description term, p = paragraph
  def documents
    @documents ||= doc.xpath("//td/dl[4]/dt").text
  end

  def vp
    @vp ||= doc.xpath("//td/p[6]").text
  end

  def cabinet
    @cabinet ||= doc.xpath("//td/dl[1]").text
  end

  def notable_events
    @notable_events ||= doc.xpath("//td/ul[2]").text
  end

  def points_of_interest
    @points_of_interest ||= doc.xpath("//td/ul[3]").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
