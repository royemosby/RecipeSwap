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
  }
]


recipes = [
  {name: "turkey sandwich",
  description: "post-Thanksgiving classic",
  ingredients: "2 slices bread, 6 oz turkey breast, 1 tbsp mayonnaise",
  instructions: "1. Lay bread out flat. 2. Slather on mayo. 3. Slice turkey in 1/8 inch sheets. 4. put turky on slice bread. 5. Join slices and eat!",
  servings: 1,
  author: "i_burn_water"
},
{
  name: "biscuits",
  description: "Makes 8-10 tender American biscuits",
  ingredients: "2 c flour, 4 tsp baking powder, 1/2 tsp cream of tartar, 2 tsp sugar, 1 tsp salt, 1/2 c shortening, 2/3 - 3/4 c milk",
  instructions: "1. Preheat oven to 450F. 2. Sift together dry ingredients. 3. Cut in shortening until largest chunks size of peas. A food processor can be used at this point by pulsing until the same texture achieved. 4. If using a food processor, transfer bowl. Slowly add milk while stirring the mixture. Add only enough so that the dough starts to come together into a ball. It will still be slightly crumbly. 5. Knead 17 times. This will decrease the crumbliness put prevent the over working of the dough. Gluten development decreases the tenderness of the biscuit. 6. Roll out to 2/3 inch to 3/4 inch thick. 7. Cut biscuits, either in squares or with a biscuit punch. 8. Bake 12-15 minutes.",
  servings: 4,
  author: "polish-grandma"
},
{
  name: "butter biscuits",
  description: "Makes 8-10 tender American biscuits",
  ingredients: "2 c flour, 4 tsp baking powder, 1/2 tsp cream of tartar, 2 tsp sugar, 1 tsp salt, 1/2 c butter, 2/3 - 3/4 c milk",
  instructions: "1. Preheat oven to 450F. 2. Sift together dry ingredients. 3. Cut in cold butter until largest chunks size of peas. A food processor can be used at this point by pulsing until the same texture achieved. 4. If using a food processor, transfer bowl. Slowly add milk while stirring the mixture. Add only enough so that the dough starts to come together into a ball. It will still be slightly crumbly. 5. Knead 17 times. This will decrease the crumbliness put prevent the over working of the dough. Gluten development decreases the tenderness of the biscuit. 6. Roll out to 2/3 inch to 3/4 inch thick. 7. Cut biscuits, either in squares or with a biscuit punch. 8. Bake 12-15 minutes.",
  servings: 4,
  author: "badazz-chef",
  original: "biscuits"
},
{name: "porterhouse steak",
  description: "perfectly seared steak for 2-4 people",
  ingredients: "16 oz porterhouse, 2 tbsp dried oregano, 2 tbsp salt",
  instructions: "1. Fill chimney starter with lump coal. 2. ball up newspaper under chimney and light. 3. Allow coal to smoke then burn until fire subsides and all coals are red-hot- in the meantime, season steak with salt and oregano. 4. Pour out embers into center of Weber grill, top up with 4 cups more unlit lump charcoal. 5. When flames subside slightly, put grate into place and lid on grill and open vents wide and let grill heat for 10 minutes. 6. Grill steak 2.5 minutes to a side for medium rare. 7. Let rest 5 minutes before serving.",
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