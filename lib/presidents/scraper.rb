class Presidents::Scraper #gives Presidents module access to the Scraper class
  #Nokogiri::HTML converts HTML to a NodeSet of Nokogiri::XML::Elements
  #open returns the URL's HTML content as a string
  def get_page
    Nokogiri::HTML(open("http://www.ipl.org/div/potus/"))
  end

  #get_page is called on an instance of the Scraper class
  #Nokogiri's .css method retrieves and returns the NodeSet corresponding to the list of presidents
  def scrape_presidents_index
    self.get_page.css("ol.potus li")
  end


  def make_presidents
    scrape_presidents_index.each do |r|  #iterates over the scraped list of presidents
      Presidents::President.new_from_index_page(r)#calls .new_from_index_page method on each instance
    end
  end
end
