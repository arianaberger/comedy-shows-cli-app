class ComedyShows::Shows

  attr_accessor :name, :description, :date, :month, :url

  @@all = []

  def initialize(show_hash)
    show_hash.each{|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def create_shows(shows_array) #creates array of show instances from the main schedule page using the scraper hash
    shows_array.each do |s|
      ComedyShows::Shows.new(r)
  end

  def self.all
    @@all
  end

  def self.find_by_month(month)
    #find from @@all if :month == month
  end


end
