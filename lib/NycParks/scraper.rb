class NycParks::Scraper

  def self.scrape_boroughs
    doc = Nokogiri::HTML(open("https://www.nycgovparks.org/park-features/parks-list"))
    borough_name = doc.css("#li_id>.nav-tabs a").collect do |boro| boro.text
    end
    borough_name
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

    self.scrape_borough_url.values.each do |url|
      doc = Nokogiri::HTML(open(url))
      name = doc.css("#navlist_header").text
      boroparks_hash["#{name}".split[0].downcase.to_sym] = doc.css("#boro-park-highlights a").collect {|park| park.text}
      end
      boroparks_hash
    end

  def self.all_boro_parks
    park_url = {}

    boro_url = self.scrape_borough_url
    boro_url.values.each do |url|
      doc = Nokogiri::HTML(open(url))
      doc.css("#boro-park-highlights a").collect {|x| park_url[x.text.to_sym] = "https://www.nycgovparks.org" + x.attribute("href").text}
    end
    park_url
  end

  def self.park_scrape

      arr_park_url = self.all_boro_parks.values
      arr_park_url.collect do |url|
        doc = Nokogiri::HTML(open(url))

        {
            :name => doc.css(".park_name_title").text,
            :address => doc.css(".park_location").text,
            :borough => doc.css("#park_info span").text,
            :park_info => doc.css('div#park_description p').text
        }
        end
      end

end
