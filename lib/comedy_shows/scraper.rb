class ComedyShows::Scraper

  BASE_PATH = "https://www.dcimprov.com/" #might not need this

  def self.get_page
    Nokogiri::HTML(open(BASE_PATH + "schedule/"))
  end

  def self.scrape_shows_list
    # self.get_page.css("div.box.main") >> How to incorporate the first show? Push into the array in the method below?
    self.get_page.css("div.leading")
    binding.pry
  end

  def self.make_show_from_list
    scrape_shows_index.each do |s|
      ComedyShows::Scraper.new_show_from_list(s)
    end
  end


end
