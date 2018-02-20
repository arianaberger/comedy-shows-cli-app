class ComedyShows::Scraper

  BASE_PATH = "https://www.dcimprov.com/" #might not need this

  def self.scrape_shows_list #this provides me with an array of shows from schedule page with basic information
    doc = Nokogiri::HTML(open(BASE_PATH + "schedule/"))
    # self.get_page.css("div.box.main") >> How to incorporate the first show? Push into the array in the method below?

    show_array = []

    doc.css("div.leading").each do |s|
      shows_hash = {
        :name => s.css("h2 a").text,
        :description: s.css("p").text,
        :date: s.css("span.scheduledate").text,
        :month: s.css("span.scheduledate").text.slice(0..2), #1st 3 letters of the month, e.g. "Feb"
        :url: s.css("h2 a")[0]["href"]
      }
      shows_array << show_hash
    end
  end

  def self.scrape_show_details
    ##re-work
    scrape_shows_index.each do |s|
      ComedyShows::Scraper.new_show_from_list(s)
    end
  end


end
