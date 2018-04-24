class NycParks::CLI

  def call
    make_parks
    greetings
    list_boroughs
    until boro_valid? == true
      list_boroughs
    end
    list_borough_parks
    until park_valid? == true
      list_borough_parks
    end
    list_a_park
    again
  end

  def make_parks
    parks_array = NycParks::Scraper.park_scrape
    NycParks::Park.create_from_collection(parks_array)
  end

  def greetings
    puts "Welcome to NYC Parks:"
  end

  def list_boroughs
    @borough = NycParks::Scraper.scrape_boroughs
    @borough.each do |borough|
      puts "#{borough}"
    end
    puts "Enter a borough for a list of parks or type exit to exit:"
    @input = gets.strip.downcase
    if @input == "exit"
      goodbye
    end
  end

  def boro_valid?
    if ["bronx", "manhattan", "queens", "brooklyn", "staten island"].include?(@input)
        return true
    else
      puts "Please enter a valid borough or type exit to exit."
        return false
    end
  end

  def list_borough_parks
    hash = NycParks::Scraper.scrape_borough_parks
    hash[@input.split[0].to_sym].each do |parks|
    puts parks
    end
    puts "Enter the park name exactly as listed for more info or type exit to exit."
    @input_park = gets.strip
    if @input_park == "exit"
      goodbye
    end
  end

  def park_valid?
    hash = NycParks::Scraper.scrape_borough_parks
    if hash[@input.split[0].to_sym].include?(@input_park)
      return true
    else
      return false
    end
  end

  def list_a_park
    park = NycParks::Park.all.detect {|park_obj| park_obj.name == @input_park}
    puts park.name
    puts park.address
    puts park.borough
    puts park.park_info
  end

  def goodbye
    puts "Thanks for stopping by!"
    exit
  end

  def again
    puts "Would you like to look at another park (yes or no)?"
    @again_input = gets.strip
    if @again_input == "yes"
      self.call
    elsif @again_input == "no"
      self.goodbye
    else
      self.again
    end
  end

end
