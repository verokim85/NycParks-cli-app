class NycParks::Park

  attr_accessor :name, :address, :borough, :park_info

  @@all = []

  def initialize(park_hash)

    park_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_collection(parks_array)
    parks_array.each do |park_hash|
    self.new(park_hash)
    end
  end

  def self.all
    @@all
  end



end
