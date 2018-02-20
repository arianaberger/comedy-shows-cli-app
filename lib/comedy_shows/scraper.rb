class ComedyShows::Scraper

  BASE_PATH = "https://www.dcimprov.com/" #might not need this

  def self.scrape_shows_list #this provides me with an array of hashes of shows from schedule page with basic information
    doc = Nokogiri::HTML(open(BASE_PATH + "schedule/"))
    # self.get_page.css("div.box.main") >> How to incorporate the first show? Push into the array in the method below?

    shows_array = []

    doc.css("div.leading").each do |s|
      shows_hash = {
        :name => s.css("h2 a").text,
        :description => s.css("p").text,
        :date => s.css("span.scheduledate").text,
        :month => s.css("span.scheduledate").text.slice(0..2).downcase, #1st 3 letters of the month, e.g. "Feb"
        :url => s.css("h2 a")[0]["href"]
      }
      # binding.pry

      shows_array << shows_hash
    end
    shows_array
  end

  def self.scrape_show_details(profile_url) #produces a hash of details on one specific show
binding.pry
    doc = Nokogiri::HTML(open(profile_url))
      profile_hash = {
          :price => doc.css("div.media li.first").text
        }
  end




end
