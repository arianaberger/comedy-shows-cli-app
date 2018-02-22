class ComedyShows::Shows

  BASE_PATH = "https://www.dcimprov.com/"

  attr_accessor :name, :description, :date, :month, :url, :tag_1, :tag_2, :tag_3, :spotlight

  @@all = [] #incorporate all scraped data here

  def initialize(show_hash)
    show_hash.each{|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.create_shows(shows_array) #creates show instances from the main schedule page using the scraper hash and pushes them into @@all
    shows_array.each do |s|
      ComedyShows::Shows.new(s)
    end
  end

  def add_show_details(details_hash) #perhaps modify to only use on individual shows when called by the cli?
    # details_hash.each{|k,v| self.send("#{k}=",v)}
    ComedyShows::Shows.new(details_hash)
  end

  def self.add_details_to_show(url) #this should all be done via Show Class! Change to do only one show at a time
    details = ComedyShows::Scraper.scrape_show_details(BASE_PATH + "#{url}") #creates a hash of details
    ComedyShows::Shows.all.detect do |s|
      if s.url == url
        details.each{|k,v| s.send("#{k}=", v)}
      end
    end
  end


  def self.all
    @@all
  end


end
