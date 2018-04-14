class NycParks::Park

  attr_accessor :name, :address, :borough, :park_info

  # def self.single_parks
  #   parks = []
  #   parks << self.scrape_single_parks
  #   parks
  # end
  #


  def self.scrape_single_parks
    @hash = {}

    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))
    scrape_borough_parks.each do |list_park|
      @park["#{boro.text}".split.join.to_sym] = "https://www.nycgovparks.org/parks/" + list_park.attribute("href").text


    name = doc.css(".park_name_title").text
    address = doc.css(".park_location").text
    borough = doc.css("#park_info span").text
    park_info = doc.css("#park_description p+ p").text
    end
  end
  @park
end


  def self.scrape_single_parks
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/parks/adam-yauch-park/?"))

    name = doc.css(".park_name_title").text
    address = doc.css(".park_location").text
    borough = doc.css("#park_info span").text
    park_info = doc.css("#park_description p+ p").text

  end




#
# doc.css("#boro-park-highlights a").each do |list_park|
#   @park["#{boro.text}".split.join.to_sym] = "https://www.nycgovparks.org/parks/" + list_park.attribute("href").text
# end
#   @park
