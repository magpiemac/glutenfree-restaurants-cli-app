#Our CLI Controller

class GlutenFreeRestaurants::CLI

  def call
    puts "Welcome to Gluten Free Restaurants in Annapolis, MD:"
    list_restaurants
    restaurant_info
    goodbye
  end

  def list_restaurants
    puts "1. Giant Foods"
    puts "2. Jerry's Subs and Pizza"
  end

  def restaurant_info
    puts "Enter the number of the restaurant that you would like more information on or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip
      case input
      when "1"
        puts "More info on restaurant 1..."
      when "2"
        puts "More info on restaurant 2..."
      end
    end
  end

  def goodbye
    puts "Thank you. Come back soon."
  end
end
