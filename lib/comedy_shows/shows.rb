class ComedyShows::Shows

  attr_accessor :name, :description, :date, :month, :url, :tag_1, :tag_2, :tag_3, :spotlight

  @@all = [] #incorporate all scraped data here

  def initialize(show_hash)
    show_hash.each{|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.create_shows(shows_array) #creates array of show instances from the main schedule page using the scraper hash
    shows_array.each do |s|
      ComedyShows::Shows.new(s)
    end
  end

  def add_show_details(details_hash)
    details_hash.each{|k,v| self.send("#{k}=",v)}
  end

  def self.all
    @@all
  end


end
