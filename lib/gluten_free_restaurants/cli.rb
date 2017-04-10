#Our CLI Controller

class GlutenFreeRestaurants::CLI

  def call
    list_restaurants
    restaurant_info
    goodbye
  end

  def list_restaurants
    puts "Gluten Free Restaurants in Annapolis, MD"
    @restaurants = GlutenFreeRestaurants::Restaurants.today
    @restaurants.each.with_index(1) do |restaurants, i|
      puts "#{i}. #{restaurants.name} #{restaurants.location}"
   end
  end

  def restaurant_info
    input = nil
    while input != "exit"
      puts "Enter the number of the restaurant that you would like more information on or type list or exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        the_restaurant = @restaurant[input.to_i-1]
        puts "#{the_restaurant.name} #{the_restaurant.location}"
      elsif input == "list"
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
