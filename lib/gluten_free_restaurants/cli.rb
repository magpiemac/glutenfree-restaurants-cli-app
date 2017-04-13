#Our CLI Controller

class GlutenFreeRestaurants::CLI

  def call
    GlutenFreeRestaurants::Scraper.new.make_restaurants
    list_restaurants
    restaurant_info
  end

  def list_restaurants
    puts "Welcome to Gluten Free Restaurants in Annapolis, MD:"
    GlutenFreeRestaurants::Restaurant.all.each.with_index(1) do |restaurant, i|
      #binding.pry
      puts "#{i}. #{restaurant.name}"
    end
  end

  def print_restaurant(restaurant)
    puts ""
    puts "Restaurant: #{restaurant.name}"
    puts "Address: #{restaurant.location}"
    puts "Distance: #{restaurant.distance}"
    puts "Features: #{restaurant.features}"
    puts "Cost: #{restaurant.cost}"
    puts ""
  end

  def restaurant_info
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the number of the restaurant that you would like more information on or type list or exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        restaurant = GlutenFreeRestaurants::Restaurant.find(input.to_i-1)
        print_restaurant(restaurant)
      elsif input == "list"
        list_restaurants
      elsif input == "exit"
        goodbye
      else puts "Invalid entry. Please type in list or exit."
      end
    end
  end

  def goodbye
    puts "Thank you. Come back soon."
  end
end
