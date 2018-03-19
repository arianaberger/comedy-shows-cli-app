class ComedyShows::Shows

  BASE_PATH = "https://www.dcimprov.com/"

  attr_accessor :name, :description, :date, :month, :url, :price, :showtime, :spotlight, :address

  @@all = [] #incorporate all scraped data here

  def initialize(show_hash)
    show_hash.each{|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.create_shows(shows_array) #creates show instances from the schedule page using scraper hash
    shows_array.each do |s|
      ComedyShows::Shows.new(s) #they are automatically pushed into @@all
    end
  end

  def self.add_details_to_show(url)
    details = ComedyShows::Scraper.scrape_show_details(BASE_PATH + "#{url}") #creates a hash of details
    ComedyShows::Shows.all.detect do |s|
      if s.url == url
        details.each{|k,v| s.send("#{k}=", v)} #adds the individual details hash to the correct instance of show
      end
    end 
  end

  def self.all
    @@all
  end

end
