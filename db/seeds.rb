users = [
  {
    username: "badazz-chef",
    email: "icook@restaraunt.com",
    password: "!QAZ@WSX"
  },
  {
    username: "i_burn_water",
    email: "cantcook@butgottaeat.org",
    password: "!QAZ@WSX"
  },
  {
    username: "polish-grandma",
    email: "nanna@paczki.com",
    password: "!QAZ@WSX"
  },
  {
    username: "grillz-mcgee",
    email: "smokedbrisket42@gmail.com",
    password: "!QAZ@WSX"
  },
    username: "roymosby",
    email: "roy@recipeswap.com",
    password: "password"
]


recipes = [
  {name: "turkey sandwich",
  description: "post-Thanksgiving classic",
  ingredients: "2 slices bread\r\n 6 oz turkey breast\r\n 1 tbsp mayonnaise",
  instructions: "1. Lay bread out flat. \r\n2. Slather on mayo. \r\n3. Slice turkey in 1/8 inch sheets. \r\n4. put turky on slice bread. \r\n5. Join slices and eat!",
  servings: 1,
  author: "i_burn_water"
},
{
  name: "biscuits",
  description: "Makes 8-10 tender American biscuits",
  ingredients: "2 c flour\r\n 4 tsp baking powder\r\n 1/2 tsp cream of tartar\r\n 2 tsp sugar\r\n 1 tsp salt\r\n 1/2 c shortening\r\n 2/3 - 3/4 c milk",
  instructions: " 1. Preheat oven to 450F.\r\n 2. Sift together dry ingredients.\r\n 3. Cut in shortening until largest chunks size of peas. A food processor can be used at this point by pulsing until the same texture achieved.\r\n 4. If using a food processor, transfer bowl. Slowly add milk while stirring the mixture. Add only enough so that the dough starts to come together into a ball. It will still be slightly crumbly.\r\n 5. Knead 17 times. This will decrease the crumbliness put prevent the over working of the dough. Gluten development decreases the tenderness of the biscuit.\r\n 6. Roll out to 2/3 inch to 3/4 inch thick.\r\n 7. Cut biscuits, either in squares or with a biscuit punch.\r\n 8. Bake 12-15 minutes.",
  servings: 4,
  author: "polish-grandma"
},
{
  name: "butter biscuits",
  description: "Makes 8-10 tender American biscuits",
  ingredients: "2 c flour\r\n 4 tsp baking powder\r\n 1/2 tsp cream of tartar\r\n 2 tsp sugar\r\n 1 tsp salt\r\n 1/2 c butter\r\n 2/3 - 3/4 c milk",
  instructions: "1. Preheat oven to 450F. 2. Sift together dry ingredients. 3. Cut in cold butter until largest chunks size of peas. A food processor can be used at this point by pulsing until the same texture achieved. 4. If using a food processor, transfer bowl. Slowly add milk while stirring the mixture. Add only enough so that the dough starts to come together into a ball. It will still be slightly crumbly. 5. Knead 17 times. This will decrease the crumbliness put prevent the over working of the dough. Gluten development decreases the tenderness of the biscuit. 6. Roll out to 2/3 inch to 3/4 inch thick. 7. Cut biscuits, either in squares or with a biscuit punch. 8. Bake 12-15 minutes.",
  servings: 4,
  author: "badazz-chef",
  original: "biscuits"
},
{name: "porterhouse steak",
  description: "perfectly seared steak for 2-4 people",
  ingredients: "16 oz porterhouse\r\n 2 tbsp dried oregano\r\n 2 tbsp salt",
  instructions: "1. Fill chimney starter with lump coal. \r\n2. ball up newspaper under chimney and light. \r\n3. Allow coal to smoke then burn until fire subsides and all coals are red-hot- in the meantime, season steak with salt and oregano. \r\n4. Pour out embers into center of Weber grill, top up with 4 cups more unlit lump charcoal. \r\n5. When flames subside slightly, put grate into place and lid on grill and open vents wide and let grill heat for 10 minutes. \r\n6. Grill steak 2.5 minutes to a side for medium rare. \r\n7. Let rest 5 minutes before serving.",
  servings: 1,
  author: "grillz-mcgee"
},

]

users.each do |user|
  User.create(username: user[:username], email: user[:email])
end

recipes.each do |recipe|
  new_recipe = Recipe.new(name: recipe[:name],  description: recipe[:description], ingredients: recipe[:ingredients], instructions: recipe[:instructions], servings: recipe[:servings])
  author = User.find_by(username: recipe[:author]) 
  author.recipes << new_recipe
  if !!recipe[:original]
    new_recipe.original = Recipe.find_by(name: recipe[:original])
  end
  new_recipe.save
end

bc = User.find_by(:username => "badazz-chef")
bc.favorites << Recipe.find(2)
bc.favorites << Recipe.find(4)

rm = User.find_by(:username => "roymosby")
rm.favorites << Recipe.find(1)
rm.favorites << Recipe.find(3)
