class ComedyShows::CLI

  BASE_PATH = "https://www.dcimprov.com/"

  def call
    make_shows #creates the initial array of shows from the index page
    add_details_to_show #remove and just call below for individual shows
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

    puts ""
    puts "Enter the number of the show you would like more information on:"

    input = gets.strip.to_i - 1
    show_details = shows[input] # equals the show instance
    #add a line to add show details to the specific instance, to be verified by the show url
    print_show_details(show_details)

    puts ""
    puts "Would you like to view more comedy shows? Enter 'Y' or 'N'"

    input = gets.strip.downcase
      if input == "y"
        start
      else
        puts ""
        puts "Thank you, come back again soon!"
        exit
      end
    end

  
    def make_shows
      shows_hash = ComedyShows::Scraper.scrape_shows_list #first scrape the shows from the main schedule page
      ComedyShows::Shows.create_shows(shows_hash) #now we have instances of shows in ComedyShows::Shows.all
    end

    def add_details_to_show #this should all be done via Show Class! Change to do only one show at a time
      ComedyShows::Shows.all.each do |s|
        details = ComedyShows::Scraper.scrape_show_details(BASE_PATH + "#{s.url}") #creates a hash of details
          s.add_show_details(details) #inputs this hash of extra details to the show
        end
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
        puts "------------------------"
        puts "#{i}. #{s.name.upcase}".colorize(:blue)
        puts "Date(s): #{s.date}"
        puts "Description: #{s.description}"
        puts ""
      end
    end

    def print_show_details(show) #argument is a show instance to be printed
      puts "#{show.tag_1}"
      puts "#{show.tag_2}"
      puts "#{show.tag_3}"
      puts "#{show.spotlight}"
    end

end
