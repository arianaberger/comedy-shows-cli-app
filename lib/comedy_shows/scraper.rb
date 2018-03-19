class ComedyShows::Scraper

  def self.scrape_shows_list #this provides me with an array of hashes of shows from schedule page with basic information
    doc = Nokogiri::HTML(open("https://www.dcimprov.com/schedule/"))

    shows_array = []

    doc.css("div.leading").each do |s|
      url = s.css("h2 a")[0]['href'] unless s.css("h2 a")[0] == nil
      # if s.css("h2 a").text == " "
      #   name = s.css("h3 a").text
      # else name = s.css("h2 a").text
      # end
      shows_hash = {
        :name => s.css("h2 a").text,
        :description => s.css("p").text,
        :date => s.css("span.scheduledate").text,
        :month => s.css("span.scheduledate").text.slice(0..2).downcase, #1st 3 letters of the month, e.g. "Feb"
        :url => url
      }
      shows_array << shows_hash if shows_hash[:name] != "" && shows_hash[:url] != ""
    end
    shows_array
  end

###Attemped to re-facter and had an error
    # shows_array = doc.css("div.leading").collect do |s|
    #     #  if condition met  / not met, then skip
    #     #    then create Hash
    #     #    else
    #     #      skip to next show
    #          if s.css("h2 a")[0] != nil || s.css("h2 a").text != ""
    #          shows_hash = {
    #          :name => s.css("h2 a").text,
    #          :description => s.css("p").text,
    #          :date => s.css("span.scheduledate").text,
    #          :month => s.css("span.scheduledate").text.slice(0..2).downcase, #1st 3 letters of the month, e.g. "Feb"
    #          :url => s.css("h2 a")[0]['href']
    #           }
    #          end
    #        shows_hash
    #      end
    #      shows_array
    #    end





  def self.scrape_show_details(profile_url) #produces a hash of details on one specific show
    doc = Nokogiri::HTML(open(profile_url))

    price = doc.css("div.media li[1]").text.gsub("Price: ", "") unless doc.css("div.media li[1]") == nil || doc.css("div.media li[1]").text.include?("Price") == false
    showtime = doc.css("div.media li[2]").text.gsub("Showtimes: ", "") unless doc.css("div.media li[2]") == nil || doc.css("div.media li[2]").text.include?("Showtimes") == false
    spotlight = doc.css("div.box[3] p").text.strip unless doc.css("div.box[2] p") == nil

      profile_hash = {
        :price => price,
        :showtime => showtime,
        :spotlight => spotlight,
        :address => doc.css("footer#footer p").text.slice(0..37)
      }
  end

end
