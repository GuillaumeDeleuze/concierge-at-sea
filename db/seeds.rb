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
  yatch_name: "Giraud",
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
guest_names = %w(Mitchell Claire Fiona Chris Gareth Frits Toto)

guests = guest_names.map do |guest_name|
	User.create(email: "#{guest_name.downcase}@cas.com", name: guest_name, password: '123soleil', booking_id: 1, guest: true)
end

puts 'Crew'
crew_names = %w(Juan Christian Emma Sebastian Titi)

crews = crew_names.map do |crew_name|
	User.create(email: "#{crew_name.downcase}@cas.com", name: crew_name, password: '123soleil', booking_id: 1, crew: true)
end

puts 'Beverages'
teas = ["Earl Grey", "English Breakfast", "Fruit", "Herbal", "Fresh Mint", "Mint", "Green", "Fresh lemon and honey"]
	Beverage.create( beverage_type: 0, name: "English Breakfast", description: "Black tea", booking_id: 1)
	Beverage.create( beverage_type: 0, name: "Fruit", description: "Red fruits infusion", booking_id: 1)
	Beverage.create( beverage_type: 0, name: "Fresh Mint", description: "Our home-grown mint leaf infusion", booking_id: 1)
	Beverage.create( beverage_type: 0, name: "Mint", description: "Strong peppermint tones", booking_id: 1)
	Beverage.create( beverage_type: 0, name: "Herbal", description: "Camomile sleepy tea", booking_id: 1)
	Beverage.create( beverage_type: 0, name: "Earl Gray", description: "Fruity black tea", booking_id: 1)
	Beverage.create( beverage_type: 0, name: "Green", description: "Full of your daily dose of antioxidants", booking_id: 1)
	Beverage.create( beverage_type: 0, name: "Fresh lemon and honey", description: "Sweet yet zingy to soothe a sore throat", booking_id: 1)

alcohols = ["Vodka", "Whiskey", "Rum", "Negroni", "Cava", "Champagne", "Beer", "Red Wine", "White Wine", "Rosé", "Limoncello"]
	Beverage.create( beverage_type: 1, name: "Vodka", description: "Shot or on the rocks", booking_id: 1)
	Beverage.create( beverage_type: 1, name: "Whiskey", description: "Shot, diluted or on the rocks", booking_id: 1)
	Beverage.create( beverage_type: 1, name: "Rum", description: "Shot or on the rocks", booking_id: 1)
	Beverage.create( beverage_type: 1, name: "Cava", description: "Spain's pride versus le Champagne, full of bubbles", booking_id: 1)
	Beverage.create( beverage_type: 1, name: "Champagne", description: "Full of bubbles to start any lunch or apéro", booking_id: 1)
	Beverage.create( beverage_type: 1, name: "Beer", description: "Chilled to perfection", booking_id: 1)
	Beverage.create( beverage_type: 1, name: "Red Wine", description: "Full-bodied and mellow to match meaty meals and the cherry chocolate notes", booking_id: 1)
	Beverage.create( beverage_type: 1, name: "White Wine", description: "Light and dry for lunchtime enjoyment or meal pairing", booking_id: 1)
	Beverage.create( beverage_type: 1, name: "Rosé", description: "Crisp and fruity for lunchtime enjoyment or early evening apéro", booking_id: 1)
	Beverage.create( beverage_type: 1, name: "Limoncello", description: "Sweet and zingy. This tastes of the Mediterranean.", booking_id: 1)

soft_drinks = ["Coke", "Coke Zero", "Ice Tea Peach", "Ice Tea Lemon", "Sprite", "Fanta", "Sparkling Water", "Still Water", "Orange Juice", "Apple Juice", "Milk", "Tonic Water"]
	Beverage.create( beverage_type: 2, name: "Orange Juice", description: "Freshly pressed and full of vitamin C", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Apple Juice", description: "Cloudy and full of vitamin C", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Sprite", description: "Lemon-based bubbles serves on the rocks with a slice of lemon", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Fanta", description: "Orange-based bubbles", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Coke", description: "Seved on the rocks with a slice of lemon", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Coke Zero", description: "Served on the rocks with a slice of lemon", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Sparkling Water", description: "Crisp and refreshing", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Still Water", description: "Beautifully simple and refreshing", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Tonic Water", description: "Served on the rocks with a slice of lemon and lime", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Ice Tea Lemon", description: "Served on the rocks with a slice of lemon", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Ice Tea Peach", description: "Served on the rocks with a slice of lemon", booking_id: 1)
	Beverage.create( beverage_type: 2, name: "Milk", description: "Semi, Whole, Skimmed, Lactose-free, Almond or Soya", booking_id: 1)

coffees = ["Cappuccino", "Espresso", "Double espresso", "Latte", "Americano", "Long black", "Macchiato", "Iced coffee"]
	Beverage.create( beverage_type: 3, name: "Cappuccino", description: "Frothy milk over a fresh espresso shot", booking_id: 1)
	Beverage.create( beverage_type: 3, name: "Espresso", description: "Short and powerful", booking_id: 1)
	Beverage.create( beverage_type: 3, name: "Double espresso", description: "Double the power and richness", booking_id: 1)
	Beverage.create( beverage_type: 3, name: "Latte", description: "Long and milky with a frothy top", booking_id: 1)
	Beverage.create( beverage_type: 3, name: "Americano", description: "Slowly filtered long black", booking_id: 1)
	Beverage.create( beverage_type: 3, name: "Long black", description: "Slowly filtered long black", booking_id: 1)
	Beverage.create( beverage_type: 3, name: "Macchiato", description: "Espresso shot 'stained' with a touch of frothy milk", booking_id: 1)
	Beverage.create( beverage_type: 3, name: "Iced coffee", description: "Shaken shot of espresso with chilled milk served on the rocks", booking_id: 1)

cocktails = ["Martini", "Manhattan", "Bloody Mary", "Margarita", "Mojito", "Negroni", "Daiquiri", "Gin & Tonic"]
	Beverage.create( beverage_type: 4, name: "Martini", description: "Gin Martini king of cocktails is a clear, classic and very strong mix of gin and vermouth. Traditionally shaken, not stirred and served chilled with an olive.", booking_id: 1)
	Beverage.create( beverage_type: 4, name: "Manhattan", description: "Similar to our Martini, but with a touch of sweetness, the Manhattan embraces a touch of bourbon and is served chilled.", booking_id: 1)
	Beverage.create( beverage_type: 4, name: "Bloody Mary", description: "Our Bloody Mary may be made for you at any time of the day with a garnish of celery to swirl vodka in to our freshly pressed tomato juice.", booking_id: 1)
	Beverage.create( beverage_type: 4, name: "Margarita", description: "A sweet tequila-based sensation of lime and crunchy sugar coating around the edges.", booking_id: 1)
	Beverage.create( beverage_type: 4, name: "Mojito", description: "A minty classic of white rum and lime served on the rocks.", booking_id: 1)
	Beverage.create( beverage_type: 4, name: "Negroni", description: "3 classic spirits blended over the rocks.", booking_id: 1)
	Beverage.create( beverage_type: 4, name: "Daiquiri", description: "Rum and lime juice blend to make an island-version of the Margarita. Request a rosy twist with our strawberry daiquiri.", booking_id: 1)
	Beverage.create( beverage_type: 4, name: "Gin & Tonic", description: "The Classic. Served with lime, basil, juniper berries on the rocks. ", booking_id: 1)

puts 'Activities'
activities = ["SEABOB", "JET SKI", "WATER SLIDE", "WAKEBOARD", "KAYAK", "PADDLE BOARD", "BANANA BOAT", "SNORKELLING", "FISHING", "WATER SKIS"]


Activity.create(yatch_id: 1, 
	name: "Seabob",
	 description: "Ride along or below the waves in the guise of a dolphin with our on board seabob, an individual experience and fun way to feel the sea pass you by.",
	 photo: "seabob.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Jet Ski",
	 description: "Feel the sea air through your hair and catch some speed while riding aboard our jet skis, but only after completing a 30-minute safety session prior to your ride.",
	 photo: "jetski.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Water Slide",
	 description: "Slide away from Giraud down the water slide to take a dip in the sea and plunge into your surrounding pool of freshness.",
	 photo: "waterslide.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Wakeboard",
	 description: "Let our crew tow you along on one board to catch the waves and test your balance since this activity takes a while to master.",
	 photo: "wakeboard.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Kayak",
	 description: "Step inside the kayak alone, with a friend or family member to take you on your own voyage out to see wherever you wish.",
	 photo: "kayak.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Paddle Board",
	 description: "This activity provides your daily dose on an arm workout and tanning opportunity, so make sure to book the paddleboard when the sea is not too rough to give yourself a chance to balance and travel a bit.",
	 photo: "paddleboard.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Banana Boat",
	 description: "Hop aboard the banana boat for a more bouncy ride along the waves while our crew give you a fun ride and flip you round corners in the hope that you will have a refreshing dip in the sea.",
	 photo: "bananaboat.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Snorkelling",
	 description: "Immerse yourself in the sea life that lives beneath you while on-board Giraud with our snorkelling gear that will be sure to satisfy you with new sights and a beautiful underwater experience.",
	 photo: "snorkelling.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Fishing",
	 description: "Try your luck at catching fish and seafood from wherever you take the tackle with this more relaxing on board activity.",
	 photo: "fishing.jpg"
)

Activity.create(yatch_id: 1, 
	name: "Water Skis",
	 description: "Get that skiing sensation summer style on our water skis where you will need to control your balance as our speedboat pulls you along to fly along the waves.",
	 photo: "waterskis.jpg"
)

puts 'Menu'
Menu.create(date: "2019.06.11", booking_id: 1)
Menu.create(date: "2019.06.12", booking_id: 1)
Menu.create(date: "2019.06.13", booking_id: 1)
Menu.create(date: "2019.06.14", booking_id: 1)

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
Dish.create(menu_id: 1, dish_type: 2, name: "Dashi/ Borlotti Beans/ Choi Sum / Clams/ Salsa Verde", description: "")
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
Dish.create(menu_id: 3, dish_type: 0, name: "Spring Onion & Siracha Mayonnaise (Vegetarian Option)", description: "")

Dish.create(menu_id: 3, dish_type: 1, name: "Slow Cooked Egg", description: "")
Dish.create(menu_id: 3, dish_type: 1, name: "Parmesan and Truffle Sauce, Potato & Celeriac Crumble (Vegetarian)", description: "")

Dish.create(menu_id: 3, dish_type: 2, name: "Umami Braised Short Rib", description: "")
Dish.create(menu_id: 3, dish_type: 2, name: "Miso & Broccoli Puree, Roasted Broccoli, Chilli, Radish & Crispy Shallots ", description: "")
Dish.create(menu_id: 3, dish_type: 2, name: "Grilled Cauliflower Steak", description: "")
Dish.create(menu_id: 3, dish_type: 2, name: "Miso & Broccoli Puree, Roasted Broccoli, Chilli, Radish & Crispy Shallots (Vegetarian Option)", description: "")

Dish.create(menu_id: 3, dish_type: 3, name: "Salted Caramel Tart", description: "")
Dish.create(menu_id: 3, dish_type: 3, name: "Milk Ice Cream, Candied Fouettine", description: "")


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

Dish.create(menu_id: 4, dish_type: 3, name: "Buttermilk Panna Cotta", description: "")
Dish.create(menu_id: 4, dish_type: 3, name: "Basil Jelly, Pomegranate, Honey Combe", description: "")
