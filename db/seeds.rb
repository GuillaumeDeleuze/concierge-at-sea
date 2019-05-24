require 'faker'

puts "delete db"
Tender.destroy_all
User.destroy_all
Booking.destroy_all
Yatch.destroy_all
Beverage.destroy_all
Activity.destroy_all
Menu.destroy_all
Dish.destroy_all

puts 'Creating 1 fake yatch...'
yatch = Yatch.new(
  yatch_name: "Vive Guillaume",
  localisation: "Avinguda de Gabriel Roca i Garcías, 27, 07157 Andratx, Illes Balears",
)
yatch.save!
puts 'Finished'

puts 'Creating 1 fake tender...'
tender = Tender.new(
  yatch_id: 1
  )
  tender.save!
  puts 'Finished'
  
  puts 'Creating 1 fake booking'
  booking = Booking.new(
    yatch_id: 1,
  )
  booking.save!

  puts 'Creating 1 fake User'
user = User.new(
  email: 'toto@toto.com',
  name: 'Toto',
  password: '123soleil',
  booking_id: 1,
  guest: true
)
user.save!

puts 'Creating 1 fake Crew member'
user = User.new(
  email: 'titi@titi.com',
  name: 'Titi',
  password: '123soleil',
  booking_id: 1,
  crew: true
)
user.save!


puts 'Creating 5 fake hot drinks...'
5.times do
  beverage = Beverage.new(
    beverage_type: 0,
    name: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    booking_id: 1

  )
  beverage.save!
end
puts 'Finished!'

puts 'Creating 5 fake soft drinks...'
5.times do
  soft_drink = Beverage.new(
    beverage_type: 2,
    name: Faker::Cannabis.cannabinoid,
    description: Faker::Cannabis.health_benefit,
    booking_id: 1
  )
  soft_drink.save!
end
puts 'Finished!'

puts 'Creating 5 fake alcohol...'
5.times do
  alcohol = Beverage.new(
    beverage_type: 1,
    name: Faker::Beer.name,
    description: Faker::Beer.style,
    booking_id: 1
  )
  alcohol.save!
end
puts 'Finished!'

puts 'Creating 5 fake all day dining...'
5.times do
  all_day_dining = Beverage.new(
    beverage_type: 3,
    name: Faker::Food.dish,
    description: Faker::Food.description,
    booking_id: 1
  )
  all_day_dining.save!
end
puts 'Finished!'

puts 'Creating 5 fake activities...'
5.times do
  activity = Activity.new(
    name: Faker::House.room,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    yatch_id: 1
  )
  activity.save!
end
puts 'Finished!'

puts 'Creating 3 fake menus...'
first_menu = Menu.new(
  date: Date.current,
  booking_id: 1
)
first_menu.save!

second_menu = Menu.new(
  date: Date.yesterday,
  booking_id: 1
)
second_menu.save!

third_menu = Menu.new(
  date: Date.tomorrow,
  booking_id: 1
)
third_menu.save!
puts 'Finished!'

puts 'Creating 4 fake Dishes per menu'
dish = Dish.new(
  menu_id: 1,
  dish_type: 0,
  name: Faker::Food.dish,
  description: Faker::Food.description
)
dish.save!

dish = Dish.new(
  menu_id: 1,
  dish_type: 1,
  name: Faker::Food.dish,
  description: Faker::Food.description
)
dish.save!

dish = Dish.new(
  menu_id: 1,
  dish_type: 2,
  name: Faker::Food.dish,
  description: Faker::Food.description
)
dish.save!

dish = Dish.new(
  menu_id: 1,
  dish_type: 3,
  name: Faker::Dessert.variety,
  description: Faker::Dessert.flavor
)
dish.save!



dish = Dish.new(
  menu_id: 2,
  dish_type: 0,
  name: Faker::Food.dish,
  description: Faker::Food.description
)
dish.save!

dish = Dish.new(
  menu_id: 2,
  dish_type: 1,
  name: Faker::Food.dish,
  description: Faker::Food.description
)
dish.save!

dish = Dish.new(
  menu_id: 2,
  dish_type: 2,
  name: Faker::Food.dish,
  description: Faker::Food.description
)
dish.save!

dish = Dish.new(
  menu_id: 2,
  dish_type: 3,
  name: Faker::Dessert.variety,
  description: Faker::Dessert.flavor
)
dish.save!


dish = Dish.new(
  menu_id: 3,
  dish_type: 0,
  name: Faker::Food.dish,
  description: Faker::Food.description
)
dish.save!

dish = Dish.new(
  menu_id: 3,
  dish_type: 1,
  name: Faker::Food.dish,
  description: Faker::Food.description
)
dish.save!

dish = Dish.new(
  menu_id: 3,
  dish_type: 2,
  name: Faker::Food.dish,
  description: Faker::Food.description
)
dish.save!

dish = Dish.new(
  menu_id: 3,
  dish_type: 3,
  name: Faker::Dessert.variety,
  description: Faker::Dessert.flavor
)
dish.save!
puts 'Finished!'