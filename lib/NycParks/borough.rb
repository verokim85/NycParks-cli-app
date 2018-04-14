class NycParks::Borough

  def self.scrape_boroughs
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))
    borough_name = doc.css("#li_id>.nav-tabs a").collect do |boro| boro.text
    end
  end

  def self.scrape_borough_url
    @hash = {}
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))
    doc.css("#li_id>.nav-tabs a").each do |boro|
      @hash["#{boro.text}".split.join.to_sym] = "https://www.nycgovparks.org/park-features/parks-list" + boro.attribute("href").text
    end
      @hash
  end

  def self.scrape_borough_parks
    boroparks_hash = {}

    NycParks::Borough.scrape_borough_url.values.each do |url|
      doc = Nokogiri::HTML(open(url))
      name = doc.css("#navlist_header").text
      boroparks_hash["#{name}".split[0].downcase.to_sym] = doc.css("#boro-park-highlights a").collect {|park| park.text}
      end
      boroparks_hash
    end

end
