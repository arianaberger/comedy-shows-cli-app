class ComedyShows::Show

  attr_accessor :name, :month, :date, :url

  @@all = []

  def initialize(name=nil, month=nil, date=nil, url=nil)
    @name = name
    @month = month
    @date = date
    @url = url
    @@all << self
  end

  def new_show_from_list(s) #this creates a new instance with default inputs from the html
    self.new(
    s.css("h2 a").text,
    s.css("p").text,
    s.css("span.scheduledate").text,
    s.css("span.scheduledate").text, #just get the month from here. Maybe 1st 3 letters?
    s.css("h2 a")[0]["href"]
    )
  end

  def self.all
    @@all
  end

  def self.find(month)
    #find from @@all if :month == month
  end


end
