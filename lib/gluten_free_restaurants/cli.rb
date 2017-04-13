
class GlutenFreeRestaurants::CLI

  def call
    GlutenFreeRestaurants::Scraper.new.make_restaurants
    restaurant_info
  end

  def list_restaurants
    puts "Welcome to Gluten Free Restaurants in Annapolis, MD:".colorize(:light_cyan)
    GlutenFreeRestaurants::Restaurant.all.each.with_index(1) do |restaurant, i|
      puts "#{i}. #{restaurant.name}".colorize(:yellow)
    end
  end

  def print_restaurant(restaurant)
    puts ""
    puts "Restaurant: #{restaurant.name}".colorize(:yellow)
    puts "Address: #{restaurant.location}".colorize(:yellow)
    puts "Distance: #{restaurant.distance}".colorize(:yellow)
    puts "Features: #{restaurant.features}".colorize(:yellow)
    puts "Cost: #{restaurant.cost}".colorize(:yellow)
    puts ""
  end

  def restaurant_info
    list_restaurants
    input = nil
    while input != "exit"
      puts ""
      puts "Which restaurant would you like more information on? Please enter a number.".colorize(:light_cyan)
      puts "You may also enter 'list' to see the restaurants again or enter 'exit' to leave the program.".colorize(:light_cyan)
      input = gets.strip
      if input == "list"
        list_restaurants
      elsif input.to_i > 0
        restaurant = GlutenFreeRestaurants::Restaurant.find(input.to_i)
        print_restaurant(restaurant)
      elsif input == "exit"
        puts "Thank you. Come back soon.".colorize(:light_cyan)
      else puts "Invalid entry. Please type in list or exit.".colorize(:red)
      end
    end
  end
end
