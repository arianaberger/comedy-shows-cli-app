class ComedyShows::Scraper


  def self.scrape_shows_list #this provides me with an array of hashes of shows from schedule page with basic information
    doc = Nokogiri::HTML(open("https://www.dcimprov.com/schedule/"))
    # self.get_page.css("div.box.main") >> How to incorporate the first show? Push into the array in the method below?

    shows_array = []

    doc.css("div.leading").each do |s|
      url = s.css("h2 a")[0]['href'] unless s.css("h2 a")[0] == nil
      shows_hash = {
        :name => s.css("h2 a").text,
        :description => s.css("p").text,
        :date => s.css("span.scheduledate").text,
        :month => s.css("span.scheduledate").text.slice(0..2).downcase, #1st 3 letters of the month, e.g. "Feb"
        :url => url
      }
      shows_array << shows_hash
    end
    shows_array
  end

  def self.scrape_show_details(profile_url) #produces a hash of details on one specific show
    # binding.pry
    doc = Nokogiri::HTML(open(profile_url)) #for some reason doc isn't registering
      profile_hash = {
        :tag_1 => doc.css("div.media li[1]").text,
        :tag_2 => doc.css("div.media li[2]").text, #don't include if text doesn't include "Showtime"
        :tag_3 => doc.css("div.media li[3]").text, #don't need?
        :spotlight => doc.css("div.box[2] p").text,
      }
  end




end
