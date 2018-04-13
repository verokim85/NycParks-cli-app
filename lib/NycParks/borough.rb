class NycParks::Borough

  # def self.boroughs
  #   boroughs = []
  #   boroughs << self.scrape_boroughs
  #   boroughs
  # end

  def self.scrape_boroughs
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))
    borough_name = doc.css("#li_id>.nav-tabs a").collect do |boro| boro.text
    end
  end



  def self.borough_parks
    borough_parks = []
    borough_parks << self.scrape_borough_parks
    borough_parks
  end

  def self.scrape_borough_parks
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))

    park_names = doc.css("#boro-park-highlights a").each do |list_park| puts list_park.text

    end
    park_names
  end


end
