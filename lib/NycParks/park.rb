class NycParks::Park

  attr_accessor :name, :address, :borough, :park_info

  @@all = []

  def initialize
    @name = "Astoria Park"
    @address = "test_address"
    @borough = "test_borough"
    @park_info = "test_park_info"
    @@all << self
  end

  def self.all
    @@all
  end





end
