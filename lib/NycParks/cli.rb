class NycParks::CLI

  def call
    list_boroughs
    parks
    goodbye
    individual_parks
  end

  def list_boroughs
    puts "NYC Boroughs:"
    @borough = NycParks::Borough.boroughs
    @borough.each do |borough|
      puts "#{borough}"
    end
  end

  def parks
    input = nil
    while input != "exit"
        puts "Enter a borough for a list of parks or type exit to exit:"
        input = gets.strip.downcase
      if input == "queens"
        puts
      elsif input == "brooklyn"
        puts
      elsif input == "bronx"
        puts
      elsif input == "manhattan"
        puts
      elsif input == "staten island"
        put
      else
        puts "Please enter a valid borough or type exit to exit."
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by!"
  end

  def individual_parks
    puts "Please enter the name of a park for more info or exit to exit."
  end

end
