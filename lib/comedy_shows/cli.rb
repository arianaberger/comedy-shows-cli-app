class ComedyShows::CLI

  def call
      start
    end

    def start
      puts ""
      puts "Welcome! Enter which month you'd like to see the upcoming shows for:"

      list_months

      input = gets.strip.downcase

      print_shows(input)
      # figure out how to validate the input
      # puts ""
      # puts "Please enter 'y' to see the first ten shows coming up, or enter 'exit' to exit the program."
      #   input = gets.strip.downcase

      puts ""
      puts "Enter the number of the show you would like more information on:"

      input = gets.strip.to_i

      print_show(input)

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

    def make_shows(from_month)
      all_shows_list = ComedyShows::Scraper.scrape_shows_list #first scrape the shows from the main schedule page
      ComedyShows::Shows.


      if from_month == "april"
        puts "April shows..."
        ComedyShows::Shows.find_by_month(from_month)
      else
        puts "ooh noooo" #this needs to loop properly if the input is wrong
      end
    end

    def print_show(from_number)
      puts "This is the info of show #{from_number}!"
    end

    def list_months
      puts "February"
      puts "March"
      puts "April"
    end

end
