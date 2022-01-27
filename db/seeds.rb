puts "🛒 Going Shopping..."
Ingredient.create(name: "coffee", is_garnish: false)
Ingredient.create(name: "espresso", is_garnish: false)

Ingredient.create(name: "ice cream", is_garnish: false)
Ingredient.create(name: "whole milk", is_garnish: false)
Ingredient.create(name: "almond milk", is_garnish: false)
Ingredient.create(name: "coconut milk", is_garnish: false)
Ingredient.create(name: "oat milk", is_garnish: false)
Ingredient.create(name: "soy milk", is_garnish: false)
Ingredient.create(name: "half & half", is_garnish: false)
Ingredient.create(name: "2% milk", is_garnish: false)

Ingredient.create(name: "brown sugar", is_garnish: false)
Ingredient.create(name: "cane sugar", is_garnish: false)
Ingredient.create(name: "white sugar", is_garnish: false)

Ingredient.create(name: "caramel", is_garnish: false)
Ingredient.create(name: "chocolate syrup", is_garnish: false)
Ingredient.create(name: "hazelnut syrup", is_garnish: false)
Ingredient.create(name: "maple syrup", is_garnish: false)
Ingredient.create(name: "peppermint syrup", is_garnish: false)
Ingredient.create(name: "white chocolate chips", is_garnish: false)
Ingredient.create(name: "white chocolate sauce", is_garnish: false)

Ingredient.create(name: "mint leaves", is_garnish: false)

Ingredient.create(name: "coffee liqueur", is_garnish: false)
Ingredient.create(name: "irish whiskey", is_garnish: false)
Ingredient.create(name: "vodka", is_garnish: false)

Ingredient.create(name: "caramel drizzle", is_garnish: true)
Ingredient.create(name: "chocolate chips", is_garnish: true)
Ingredient.create(name: "chocolate powder", is_garnish: true)
Ingredient.create(name: "crumbled oreos", is_garnish: true)
Ingredient.create(name: "mint leaves", is_garnish: true)
Ingredient.create(name: "nutmeg", is_garnish: true)
Ingredient.create(name: "espresso beans", is_garnish: true)
Ingredient.create(name: "peppermint sprinkles", is_garnish: true)
Ingredient.create(name: "whipped cream", is_garnish: true)
Ingredient.create(name: "whole coffee beans", is_garnish: true)

puts "😴 Waking up baristas..."

Recipe.create(name: "mint mojito", prep_type: "fine", is_heated: false, prep_time:"10 min", measurements: ["16 oz total", "", "1-2 tbs", ""],
    instructions: [
        "Place a small pillow of mints leaves WITH the stems still attached in the bottom of the cup. Most of the mint flavor comes from the stems, not the leaves.",

        "If you like it \"sweet\" add 2 tbs of brown sugar, if you like if \"Philz way\" add just 1 tbs.",

        "Add just a bit of boiling water. Using a muddler or the back of a spoon, pound the mint leaves to release all of their flavor. You don't want to twist the muddler, as you'll tear the leaves and get leaf bits floating around your drink.",

        "Add your ice and coffee (I'd always add some coffee first to make sure the sugar mixes well, add my ice, and then the rest of the coffee). Top with heavy cream. To get it foamy you'll need to shake it hard in the container. If your container is too full then pour some out in a cup to make room and then just put it back once you're done.",

        "Top with a pretty mint leaf."
    ],
    source: "https://www.reddit.com/r/Coffee/comments/buphap/any_help_on_making_a_philz_iced_mint_mojito_at/",
    image: nil
)

Recipe.create(name: "white chocolate mocha", prep_type: "espresso", is_heated: true, prep_time: "3 minutes", measurements: ["4 Tbsp", "1 shot", "1 cup", ""],
    instructions: [
        "Heat up white chocolate chips on low heat until softened.",
        "Prepare 1 shot of espresso and pour into a mug (1 shot = 1 oz).",
        "Stir hot espresso and softened white chocolate together.",
        "Froth 2% milk using your preferred method.",
        "Pour frothed milk into mug.",
        "Top with whipped cream.",

        "Note from 1NJ57C3, <projectnameplaceholder> Dev Team): \"Try this with coconut milk. One of my favorites!\""
    ],
    source: "https://athome.starbucks.com/recipe/white-chocolate-mocha",
    image: "https://athome.starbucks.com/sites/default/files/styles/recipe_xlarge_normal/public/2021-07/WhiteChocolateMocha_Recipe.jpg?h=cf77c377&itok=C62SMeLC"
)

Recipe.create(name: "espresso martini", prep_type: "espresso", is_heated: false, prep_time: "5 minutes", measurements: ["1 shot", "4 Tbsp", "2 Tbsp", "3"],
    instructions: [
        "Prepare 1 shot of Starbucks® Espresso Roast coffee and let cool before prepping the cocktail.",
        "Place the vodka, coffee liqueur and espresso in a cocktail shaker with ice.​",
        "Shake vigorously 10 times, then strain briskly into a cocktail glass.",
        "Garnish with 3 coffee beans and serve immediately.",
    ],
    source: "https://athome.starbucks.com/recipe/espresso-martini",
    image: "https://athome.starbucks.com/sites/default/files/styles/recipe_xlarge_normal/public/2021-09/EspressoMartini_Web_New_Header_2880x1660_2.jpg?h=cf77c377&itok=pVRV0DGz"
)

puts "🥱 Ugh... Why do I keep getting stuck with the morning shift?"

Drink.create(recipe: Recipe.first, ingredient: Ingredient.find_by(name: "coffee"))
Drink.create(recipe: Recipe.first, ingredient: Ingredient.find_by(name: "mint leaves", is_garnish: false))
Drink.create(recipe: Recipe.first, ingredient: Ingredient.find_by(name: "brown sugar"))
Drink.create(recipe: Recipe.first, ingredient: Ingredient.find_by(name: "mint leaves", is_garnish: true))

Drink.create(recipe: Recipe.second, ingredient: Ingredient.find_by(name: "white chocolate chips"))
Drink.create(recipe: Recipe.second, ingredient: Ingredient.find_by(name: "espresso"))
Drink.create(recipe: Recipe.second, ingredient: Ingredient.find_by(name: "2% milk"))
Drink.create(recipe: Recipe.second, ingredient: Ingredient.find_by(name: "whipped cream"))

Drink.create(recipe: Recipe.third, ingredient: Ingredient.find_by(name: "espresso"))
Drink.create(recipe: Recipe.third, ingredient: Ingredient.find_by(name: "vodka"))
Drink.create(recipe: Recipe.third, ingredient: Ingredient.find_by(name: "coffee liqueur"))
Drink.create(recipe: Recipe.third, ingredient: Ingredient.find_by(name: "whole coffee beans"))

puts "☕ All done. Enjoy!"
