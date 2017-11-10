class Presidents::President #gives Presidents module access to the President class
 attr_accessor :name, :url, :documents, :vp, :cabinet, :notable_events, :points_of_interest

 @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("a").text,
      "http://www.ipl.org/div/potus/#{r.css("a").attribute("href").text}"
      )
  end

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id - 1]
  end

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
