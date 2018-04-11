class NycParks::Borough

  attr_accessor :name

  def self.boroughs
    self.scrape_boroughs
  end

  def self.scrape_boroughs
    boroughs = []
    boroughs << self.scrape_nycboroughs
    boroughs
  end

  def self.scrape_nycboroughs
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))

    borough_name = doc.css("#li_id>.nav-tabs a").each {|x| puts x.text}
  end

end
