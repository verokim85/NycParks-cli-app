class NycParks::CLI

  def call
    list_boroughs
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

  #
  # def list_borough_parks
  #   @borough_parks = NycParks::Borough.scrape_borough_parks
  #   @borough_parks.each do |borough_parks|
  #     borough parks
  #   end
  # end



  def list_parks
    @list_parks = NycParks::Park.scrape_single_parks
  end


  def parks
    input = nil
      input != "exit"
        puts "Enter a borough for a list of parks or type exit to exit:"
        input = gets.strip.downcase
        hash = NycParks::Borough.scrape_borough_parks
      hash[input.to_sym].each {|x| puts x}

      else
        puts "Please enter a valid borough or type exit to exit."

      end


    while input != "exit"
        puts "Enter the name of a park for more info or type exit to exit."
        input = gets.strip.downcase
        list_parks
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by!"
  end
