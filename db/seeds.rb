# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Bookmark.destroy_all
Recipe.destroy_all

puts "Creating recipes..."
# Recipe.create(name: "Easy chicken curry", description: "This easy staple chicken curry is a fantastic recipe for family dinners. It's made with just a handful of ingredients and is enriched with creamy yogurt", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=556,505", rating: 4.5)
# Recipe.create(name: "Oven-baked risotto", description: "Cook this simple storecupboard risotto in the oven while you get on with something else, the result is still wonderfully creamy rating", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-373498_11-af7aea1.jpg?quality=90&webp=true&resize=440,400", rating: 4)
# Recipe.create(name: "Korean corndogs", description: "Try this popular street food from Korea where hot dogs are wrapped in a crisp corn batter.", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2024/09/KoreanCorndog-63c63dc.jpg?quality=90&webp=true&resize=600,545", rating: 4)
# Recipe.create(name: "Spicy root & lentil casserole", description: "Our idea of the perfect veggie supper", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-488691_11-ca2ba1d.jpg?quality=90&webp=true&resize=440,400", rating: 5)
# Recipe.create(name: "Crispy shredded chicken", description: "Try this takeaway favourite served with rice, or simply on its own as part of a buffet-style meal", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2023/09/Crispy-shredded-chicken-cb41b41.jpg?quality=90&webp=true&resize=600,545", rating: 3.5)
# Recipe.create(name: "American pancakes", description: "Easy, American-style, fluffy pancakes are great for feeding a crowd at breakfast or brunch.", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/american-style-pancakes-87119e3.jpg", rating: 4.5)
# Recipe.create(name: "Mushroom & basil omelette with smashed tomato", description: "A vegetarian breakfast with bite, try this egg dish with cream cheese, herbs and grilled tomatoes", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/omelette-8cfdcfd.jpg?resize=440%2C230", rating: 4)
# Recipe.create(name: "Ultimate crème brûlée", description: "With a rich, creamy vanilla custard and crunchy, caramelised topping, our crème brûlée makes the ultimate indulgent dessert", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-3745_10-3e374d0.jpg", rating: 5)
# Recipe.create(name: "One-pan nachos with black beans", description: "Enjoy this colourful sharing dish with nachos, black beans, salsa, avocado and melted cheese.", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/one-pan-nachos-with-black-beans-475af61.jpg?quality=90&resize=440,400", rating: 3.5)
# Recipe.create(name: "Nutty chicken satay strips", description: "Keep these nutty chicken satay strips in the fridge for a healthy choice when you're peckish.", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/nutty-chicken-sate-strips-67269e0.jpg?resize=440%2C230", rating: 4)
puts "Finished!"


require "json"
require "open-uri"

def recipe_builder(meal_id)
  recipe_url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal_id}"
  recipe_data = URI.open(recipe_url).read
  recipe_json = JSON.parse(recipe_data)
  recipe_json["meals"][0]
  p Recipe.create(
    name: recipe_json["meals"][0]["strMeal"],
    description: recipe_json["meals"][0]["strInstructions"],
    image_url: recipe_json["meals"][0]["strMealThumb"],
    rating: rand(1.5..5).round(1)
  )
end

categories = [ "Breakfast", "Pasta", "Chicken", "Vegetarian" ]

categories.each do |category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  category_data = URI.open(url).read
  category_json = JSON.parse(category_data)
  meals = category_json["meals"]

    meals.take(5).each do |meal|
      meal_id = meal["idMeal"]
      recipe_builder(meal_id)
    end
end
