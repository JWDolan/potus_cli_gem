class Presidents::Scraper #gives Presidents module access to the Scraper class
  
  def get_page
    Nokogiri::HTML(open("http://www.ipl.org/div/potus/"))
  end

  
  def scrape_presidents_index
    self.get_page.css("ol.potus li")
  end


  def make_presidents
    scrape_presidents_index.each do |r|  
      Presidents::President.new_from_index_page(r)
    end
  end
end
