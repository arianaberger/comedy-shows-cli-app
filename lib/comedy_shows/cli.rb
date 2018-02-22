class ComedyShows::CLI

  BASE_PATH = "https://www.dcimprov.com/"

  def call
    make_shows #creates the initial array of shows from the index page
    puts ""
    puts "Welcome!"
    start
    end

  def start
    puts ""
    puts "Enter which month you'd like to see the upcoming shows for:"
    puts "(e.g. 'Feb' for February or 'Jul' for July)"

    input = gets.strip.downcase

    shows = get_shows_from_month(input)
    print_shows(shows)

    puts "-------------".colorize(:blue)
    puts "Enter the number of the show you would like more information on:"

    input = gets.strip.to_i - 1
    show_url = shows[input].url # equals the show instance
    print_show_details(show_url)

    see_shows

    end

    def see_shows #loop!
      puts ""
      puts "Would you like to view more comedy shows? Enter 'Y' or 'N'"

      input = gets.strip.downcase
      if input == "y"
        start
      elsif input == "n"
        puts ""
        puts "Thank you for supporting local comedy!"
        exit
      else
        puts "Sorry please...try again"
        see_shows
      end
    end


    def make_shows
      shows_hash = ComedyShows::Scraper.scrape_shows_list #first scrape the shows from the main schedule page
      ComedyShows::Shows.create_shows(shows_hash) #now we have instances of shows in ComedyShows::Shows.all
    end

    def get_shows_from_month(month_input) #this makes the shows and then pulls only those from the specified month input
      month_array = []
      ComedyShows::Shows.all.each do |s|
        if s.month == month_input
          month_array << s
        end
      end
      if month_array.count == 0 #checks that the month is correct
        puts "Sorry, there are no shows for that month!"
        start
      end
      month_array
    end


    def print_shows(list) #list will be an array of show instances from the main schedule page
      list.each.with_index(1) do |s, i|
        puts ""
        puts "#{i}. #{s.name.upcase}".colorize(:blue)
        puts "Date(s): #{s.date}"
        puts "Description: #{s.description}"
        puts ""
      end
    end

    def print_show_details(url) #argument is a show instance to be printed
      show = ComedyShows::Shows.add_details_to_show(url)

      puts ""
      puts "-------------#{show.name.upcase}-----------".colorize(:red)
      puts ""
      puts "Price:         #{show.price}" unless show.price == nil
      puts "Showtime(s):   #{show.showtime}" unless show.showtime == nil
      puts "Address:       #{show.address}"
      puts ""
      puts "DESCRIPTION:".colorize(:yellow)
      puts "#{show.spotlight}".colorize(:yellow)
      puts ""
      puts "-------------".colorize(:red)
    end

end
