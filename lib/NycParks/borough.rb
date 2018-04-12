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
    borough_name = doc.css("#li_id>.nav-tabs a").each {|boro| puts boro.text}
    end
  end

  def self.scrape_park_names
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))
    park_names = doc.css("#boro-park-highlights a").each {|list_park| puts list_park.text}
    end
  end

end
