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
        puts "Enter the borough for a list of parks or type exit to exit:"
        input = gets.strip.downcase
      if input == @borough
        the_boroughs =  @borough
        puts "#{the_boroughs.name}"
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
