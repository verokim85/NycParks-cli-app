class NycParks::Borough

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
    borough_name = doc.css("#li_id>.nav-tabs a").each do |boro| puts boro.text
    end
    borough_name
  end


  def self.borough_parks
    self.scrape_borough_parks
  end

  def self.scrape_borough_parks
    borough_parks = []
    borough_parks << self.scrape_nyc_boro_parks
    borough_parks
  end

  def self.scrape_nyc_boro_parks
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))

    park_names = doc.css("#boro-park-highlights a").each do |list_park| puts list_park.text
    end
    park_names
  end


end
