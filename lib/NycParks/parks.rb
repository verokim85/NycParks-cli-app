class NycParks::Parks

  attr_accessor :name, :address, :borough, :park_info

  def self.park
    self.scrape_parks
  end

  def self.scrape_parks
    parks = []
    parks << self.scrape_nycparks
    parks
  end

  def self.scrape_nycparks
    binding.pry
      doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list?"))
    park = self.new
    park.name =
    park.address =
    park.borough =
    park.park_info =

    park
  end


end
