class NycParks::Borough

  attr_accessor :name

  def self.boroughs
    self.scrape_boroughs
  end

  def self.scrape_boroughs
    boroughs = []

    boroughs <<

    boroughs << self.scrape_nycpark

    boroughs
  end

  def self.scrape_nycpark
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))
    binding.pry
    borough_name = doc.css("#li_id>.nav-tabs a").each {|x| puts x.text}
  end
end
