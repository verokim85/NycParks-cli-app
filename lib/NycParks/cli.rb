class NycParks::CLI

  def call
    list_boroughs
    boro
    # list_borough_parks
    # list_parks
    parks
    goodbye

  end

  def list_boroughs
    puts "NYC Boroughs:"
    @borough = NycParks::Borough.scrape_boroughs
    @borough.each do |borough|
    puts "#{borough}"
    end
  end

  def boro
    NycParks::Borough.park_scrape
  end

  # def list_borough_parks
  #   @borough_parks = NycParks::Borough.scrape_borough_parks
  #   @borough_parks.each do |borough_parks|
  #     borough parks
  #   end
  # end


  #
  # def list_parks
  #   @list_parks = NycParks::Park.scrape_single_parks
  # end


  def parks
    input = nil
    while input != "exit"
        puts "Enter a borough for a list of parks or type exit to exit:"
        input = gets.strip.downcase
      if ["bronx", "manhattan", "queens", "brooklyn", "staten island"].include?(input)
        hash = NycParks::Borough.scrape_borough_parks
        hash[input.split[0].to_sym].each {|x| puts x}
      else
        puts "Please enter a valid borough or type exit to exit."
      end

    puts "Enter the park name exactly as listed or more info or type exit to exit."
      input = gets.strip


    #     input = gets.strip.downcase
    #     list_parks
    end
  end
  # end

  def goodbye
    puts "Thanks for stopping by!"
  end
end
