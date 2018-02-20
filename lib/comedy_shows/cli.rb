class ComedyShows::CLI

  def call
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

    input = gets.strip.to_i

    get_shows_from_month(input)

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

    def get_shows_from_month(month_input) #this makes the shows and then pulls only those from the specified month input
      make_shows
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

      def make_shows
        all_shows_list = ComedyShows::Scraper.scrape_shows_list #first scrape the shows from the main schedule page
        ComedyShows::Shows.create_shows(all_shows_list) #now we have instances of shows in ComedyShows::Shows.all
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



end
