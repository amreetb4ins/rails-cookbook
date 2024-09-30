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
Recipe.destroy_all

puts "Creating recipes..."
Recipe.create(name: "Easy chicken curry", description: "This easy staple chicken curry is a fantastic recipe for family dinners. It's made with just a handful of ingredients and is enriched with creamy yogurt", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=556,505", rating: 8.5)
Recipe.create(name: "Oven-baked risotto", description: "Cook this simple storecupboard risotto in the oven while you get on with something else, the result is still wonderfully creamy rating", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-373498_11-af7aea1.jpg?quality=90&webp=true&resize=440,400", rating: 8)
Recipe.create(name: "Korean corndogs", description: "Try this popular street food from Korea where hot dogs are wrapped in a crisp corn batter.", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2024/09/KoreanCorndog-63c63dc.jpg?quality=90&webp=true&resize=600,545", rating: 7.8)
Recipe.create(name: "Spicy root & lentil casserole", description: "Our idea of the perfect veggie supper", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-488691_11-ca2ba1d.jpg?quality=90&webp=true&resize=440,400", rating: 7.5)
Recipe.create(name: "Crispy shredded chicken", description: "Try this takeaway favourite served with rice, or simply on its own as part of a buffet-style meal", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2023/09/Crispy-shredded-chicken-cb41b41.jpg?quality=90&webp=true&resize=600,545", rating: 8)

puts "Finished!"
