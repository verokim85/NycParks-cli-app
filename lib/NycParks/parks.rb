class NycParks::Parks

  attr_accessor :name, :address, :borough, :park_info

  def self.parks
    park_1 = self.new
    park_1 = "Queens"
    park_1 = "123-223"
    park_1 = "Queens"
    park_1 = "Queens"


    park_2 = self.new
    park_2 = "Brooklyn"
    park_2 = "123-223"
    park_2 = "Brooklyn"
    park_2 = "Brooklyn"

    [park_1, park_2]

    # self.scrape_parks
  end


end
