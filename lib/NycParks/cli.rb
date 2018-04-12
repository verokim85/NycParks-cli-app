class NycParks::CLI

  def call
    list_boroughs
    list_borough_parks
    list_parks
    parks
    goodbye
    # individual_parks
  end

  def list_boroughs
    puts "NYC Boroughs:"
    @borough = NycParks::Borough.boroughs
    @borough.each do |borough|
    puts "#{borough}"
    end
  end

  def list_borough_parks
    @borough_parks = NycParks::Borough.borough_parks
    @borough_parks.each do |borough_parks|
  end

  def list_parks
    @list_parks = NycParks::Park.single_park
    # @list_parks.each do |list_parks|
  end


  def parks
    input = nil
    while input != "exit"
        puts "Enter a borough for a list of parks or type exit to exit:"
        input = gets.strip.downcase
      if input == "bronx"
        list_borough_parks
      elsif input =="brooklyn"
        list_borough_parks
      elsif input =="manhattan"
        list_borough_parks
      elsif input =="queens"
        list_borough_parks
      elsif input =="staten island"
        list_borough_parks
      else
        puts "Please enter a valid borough or type exit to exit."
        end
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by!"
  end

  # def individual_parks
  #   puts "Please enter the name of a park for more info or exit to exit."
  # end


end
