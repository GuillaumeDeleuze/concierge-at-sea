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
  yatch_name: "My Giraud",
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
  	start_at: "2019.06.13",
	  end_at: "2019.06.18"
  )
  booking.save!

 puts 'Creating 1 fake chatroom'
  chatroom = Chatroom.new(
    booking_id: 1,
    name: "General"
  )
  chatroom.save!
  puts 'Finished'

puts 'Guest'  
guest_names = %w(Mitchell Claire Fiona Chris Gareth Frits)

guests = guest_names.map do |guest_name|
	User.create(email: "#{guest_name.downcase}@cas.com", name: guest_name, password: '123soleil', booking_id: 1, guest: true)
end

puts 'Crew'
crew_names = %w(Juan Christian Emma Sebastian)

crews = crew_names.map do |crew_name|
	User.create(email: "#{crew_name.downcase}@cas.com", name: crew_name, password: '123soleil', booking_id: 1, crew: true)
end

puts 'Beverages'
hot_drinks = ["English Breakfast Tea", "Earl Grey Tea", "Peppermint Tea", "Green Tea", "Camomile", "Jasmine Tea", "Lemon & Tea", "Red fruits Tea", "Espresso", "Americano", "Decaff", "Espresso Macchiato", "Cappuccino", "Caffe Latte"]

beverage = hot_drinks.map do |hot_drink|
	Beverage.create( beverage_type: 0, name: hot_drink, description: "", booking_id: 1)
end
  
soft_drinks = ["Orange Juice", "Apple Juice", "Lemonade", "Fanta", "Coca Cola", "Sparkling water", "Still water", "Milk"]

beverage = soft_drinks.map do |soft_drink|
	Beverage.create( beverage_type: 1, name: soft_drink, description: "", booking_id: 1)
end

alcohols = ["Gin & Tonic", "Vodka", "Whiskey", "Rum", "Negroni", "Cava", "Champagne", "Beer", "Red Wine", "White Wine", "Rosé"]

beverage = alcohols.map do |alcohol|
	Beverage.create( beverage_type: 2, name: alcohol, description: "", booking_id: 1)
end


puts 'Activities'
activities = ["SEABOB", "JET SKI", "WATER SLIDE", "WAKEBOARD", "KAYAK", "PADDLE BOARD", "BANANA BOAT", "SNORKELLING", "FISHING", "WATER SKIS"]


Activity.create(yatch_id: 1, 
	name: "Seabob",
	 description: "Ride along or below the waves in the guise of a dolphin with our on board seabob. This is an individual experience and fun way to feel the sea pass you by.",
	 photo: "seabob.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Jet Ski",
	 description: "Feel the sea air through your hair and catch some speed while riding aboard our jet skis. Let it be known that you must complete a 30-minute safety session prior to your ride. This activity may be enjoyed for a maximum of 2 guests at a time on each jet ski.",
	 photo: "jetski.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Water Slide",
	 description: "Slide away from Giraud down the water slide and take a dip in the sea. Our slide is a fun way to take the plunge.",
	 photo: "waterslide.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Wakeboard",
	 description: "Let our crew tow you along on one board to catch the waves and test your balance. This is fun, but takes a while to master.",
	 photo: "wakeboard.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Kayak",
	 description: "Step inside the kayak alone, with a friend or family member. These kayaks have 2 seats and can take you on your own voyage out to see wherever you wish.",
	 photo: "kayak.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Paddle Board",
	 description: "This activity provides your daily dose on an arm workout and tanning opportunity. Make sure to book the paddleboard when the sea is not too rough, so that you give yourself a chance to balance and travel a bit.",
	 photo: "paddleboard.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Banana Boat",
	 description: "Hop aboard the banana boat for a more bouncy ride along the waves. Our crew will give you a fun ride and flip you round corners in the hope that you will have a refreshing dip in the sea.",
	 photo: "bananaboat.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Snorkelling",
	 description: "Immerse yourself in the sea life that lives beneath you while on-board Giraud. Our snorkelling gear is sure to satisfy you with new sights and a beautiful underwater experience.",
	 photo: "snorkelling.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Fishing",
	 description: "Try your luck at catching fish and seafood from wherever you take the tackle. This is one of the more relaxing activities we offer our guests. ",
	 photo: "fishing.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Water Skis",
	 description: "Get that skiing sensation summer style on our water skis. Wear 2 skis and control your balance as our speedboat pulls you along to fly above the waves. ",
	 photo: "waterskis.jpg"
)

puts 'Menu'
Menu.create(date: "2019.06.08", booking_id: 1)
Menu.create(date: "2019.06.09", booking_id: 1)
Menu.create(date: "2019.06.10", booking_id: 1)
Menu.create(date: "2019.06.11", booking_id: 1)

puts 'Dish'
Dish.create(menu_id: 1, dish_type: 0, name: "Smoked Goats Cheese & Miso Mousse", description: "")
Dish.create(menu_id: 1, dish_type: 0, name: "Beetroot Crostini/ Lovage (Vegetarian) ", description: "")
Dish.create(menu_id: 1, dish_type: 0, name: "Sherry vinegar & Black Pepper Whipped Tofu (Vegan Option)", description: "")
Dish.create(menu_id: 1, dish_type: 0, name: "Beetroot Crostini/ Lovage", description: "")

Dish.create(menu_id: 1, dish_type: 1, name: "Smoked Steak Tartare", description: "")
Dish.create(menu_id: 1, dish_type: 1, name: "Taleggio/ Mustard/ Truffle Potato Chips", description: "")
Dish.create(menu_id: 1, dish_type: 1, name: "Beetroot & Chickpea Tartare ", description: "")
Dish.create(menu_id: 1, dish_type: 1, name: "Taleggio/ Mustard/ Truffle Chips", description: "")

Dish.create(menu_id: 1, dish_type: 2, name: "Fish", description: "")
Dish.create(menu_id: 1, dish_type: 2, name: "Dashi/ Barlotti Beans/ Choi Sum / Clams/ Salsa Verde", description: "")
Dish.create(menu_id: 1, dish_type: 2, name: "Charred Tenderstem Broccoli", description: "")
Dish.create(menu_id: 1, dish_type: 2, name: "Crispy Tofu/ Salsa Verde/ Samjang Yoghurt/ Herb Salad", description: "")

Dish.create(menu_id: 1, dish_type: 3, name: "Passionfruit Delice", description: "")
Dish.create(menu_id: 1, dish_type: 3, name: "Candied Pine Nuts/ Mint/ Kiwi", description: "")


Dish.create(menu_id: 2, dish_type: 0, name: "Avocado & Wasabi Mousse", description: "")
Dish.create(menu_id: 2, dish_type: 0, name: "Kimchi Polenta/ Garlic/ Parsley ", description: "")
Dish.create(menu_id: 2, dish_type: 0, name: "Brandade", description: "")


Dish.create(menu_id: 2, dish_type: 1, name: "Melon Ham", description: "")
Dish.create(menu_id: 2, dish_type: 1, name: "Grilled Melon/ Tomato/ Popped Pepitas/ Balsamic Emulsion/ Coriander/ Ice Plant ", description: "")

Dish.create(menu_id: 2, dish_type: 2, name: "Charred Cod", description: "")
Dish.create(menu_id: 2, dish_type: 2, name: "BBQ Sweetcorn/ Bok Choi/ Radish/ Crispy Quinoa/ Chimichurri", description: "")
Dish.create(menu_id: 2, dish_type: 2, name: "Falafal ", description: "")
Dish.create(menu_id: 2, dish_type: 2, name: "BBQ Sweetcorn/ Bok Choi/ Radish/ Puffed Quinoa/ Chimichurri", description: "")

Dish.create(menu_id: 2, dish_type: 3, name: "Compressed Watermelon", description: "")
Dish.create(menu_id: 2, dish_type: 3, name: "Coconut Mousse, Candied Coconut, Passionfruit", description: "")


Dish.create(menu_id: 3, dish_type: 0, name: "Arroz Negro Arancini", description: "")
Dish.create(menu_id: 3, dish_type: 0, name: "Spring Onion & Siracha Mayonnaise ", description: "")
Dish.create(menu_id: 3, dish_type: 0, name: "Tempura Enoki Mushroom", description: "")
Dish.create(menu_id: 3, dish_type: 0, name: "Spring Onion & Siracha Mayonnaise (vegetarian Option)", description: "")

Dish.create(menu_id: 3, dish_type: 1, name: "Slow Cooked Egg", description: "")
Dish.create(menu_id: 3, dish_type: 1, name: "Parmesan and Truffle Sauce, Potato & Celeriac Crumble (vegetarian)", description: "")

Dish.create(menu_id: 3, dish_type: 2, name: "Umami Braised Short Rib", description: "")
Dish.create(menu_id: 3, dish_type: 2, name: "Miso & Broccoli Puree, Roasted Broccoli, Chilli, Radish & Crispy Shallots ", description: "")
Dish.create(menu_id: 3, dish_type: 2, name: "Grilled Cauliflower Steak", description: "")
Dish.create(menu_id: 3, dish_type: 2, name: "Miso & Broccoli Puree, Roasted Broccoli, Chilli, Radish & Crispy Shallots (vegetarian option)", description: "")

Dish.create(menu_id: 3, dish_type: 3, name: "Salted Caramel Tart", description: "")
Dish.create(menu_id: 3, dish_type: 3, name: "Milk Ice Cream, Candied Fuiettine", description: "")


Dish.create(menu_id: 4, dish_type: 0, name: "Steamed Bun", description: "")
Dish.create(menu_id: 4, dish_type: 0, name: "Truffle, Parmesan, Basil ", description: "")

Dish.create(menu_id: 4, dish_type: 1, name: "Seabass Ceviche", description: "")
Dish.create(menu_id: 4, dish_type: 1, name: "Mussel Cracker/ Black garlic Aioli", description: "")
Dish.create(menu_id: 4, dish_type: 1, name: "Sweet Potato Ceviche ", description: "")
Dish.create(menu_id: 4, dish_type: 1, name: "Tapioca Cracker/ Black Garlic Aioli", description: "")

Dish.create(menu_id: 4, dish_type: 2, name: "Miso, franks & mustard glazed pork tenderloin", description: "")
Dish.create(menu_id: 4, dish_type: 2, name: "Crispy pasta, pickled apple, bok choi laoganma chilli crisp", description: "")
Dish.create(menu_id: 4, dish_type: 2, name: "Miso, franks & mustard glazed celeriac", description: "")
Dish.create(menu_id: 4, dish_type: 2, name: "Crispy pasta, pickled apple, bok choi laoganma chilli crisp", description: "")

Dish.create(menu_id: 4, dish_type: 3, name: "Buttermilk Pana Cotta", description: "")
Dish.create(menu_id: 4, dish_type: 3, name: "Basil Jelly, Pomegranate, Honey Combe", description: "")
