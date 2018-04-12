class NycParks::Park

  attr_accessor :name, :address, :borough, :park_info

  def self.single_park
    self.scrape_single_parks
  end

  def self.scrape_single_parks
    parks = []
    parks << self.scrape_single_ny_parks
    parks
  end

  def self.scrape_single_ny_parks
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/parks/adam-yauch-park/?"))

    name = doc.css(".park_name_title").text
    address = doc.css(".park_location").text
    borough = doc.css("#park_info span").text
    park_info = doc.css("#park_description p+ p").text
    binding.pry
  end


end
