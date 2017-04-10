#Our CLI Controller

class GlutenFreeRestaurants::CLI

  def call
    puts "Welcome to Gluten Free Restaurants in Annapolis, MD:"
    list_restaurants
    restaurant_info
    goodbye
  end

  def list_restaurants    
    @restaurants = GlutenFreeRestaurants::Restaurants.today
  end

  def restaurant_info
    input = nil
    while input != "exit"
      puts "Enter the number of the restaurant that you would like more informationo on or type list or exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on restaurant 1..."
      when "2"
        puts "More info on restaurant 2..."
      when "list"
        list_restaurants
      else
        puts "Invalid entry. Please type in list or exit."
      end
    end
  end

  def goodbye
    puts "Thank you. Come back soon."
  end
end
