class NycParks::Borough

  def self.scrape_boroughs
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))
    borough_name = doc.css("#li_id>.nav-tabs a").collect do |boro| boro.text
    end
  end

  def self.scrape_borough_url
    hash = {}
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))
    doc.css("#li_id>.nav-tabs a").each do |boro|
      hash["#{boro.text}".split.join.to_sym] = "https://www.nycgovparks.org/park-features/parks-list" + boro.attribute("href").text
    end
      hash
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
  # def self.scrape_borough_parks
  #   boroparks_hash = {}
  #
  #   NycParks::Borough.scrape_borough_url.values.each do |url|
  #     doc = Nokogiri::HTML(open(url))
  #     name = doc.css("#navlist_header").text
  #     boroparks_hash["#{name}".split[0].downcase.to_sym] = {}
  #     end
  #     boroparks_hash
  #   end

  def self.all_boro_parks
    park_url = {}

    temp = self.scrape_borough_url
    temp.values.each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.css("#boro-park-highlights a").collect {|x| park_url[x.text.to_sym] = "https://www.nycgovparks.org" + x.attribute("href").text}
    end
    park_url
  end

  # def self.park_scrape(input)
  #   doc = Nokogiri::HTML(open("https://www.nycgovparks.org/parks/joyce-kilmer-park/"))
  #
  # end



end
