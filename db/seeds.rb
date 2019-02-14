require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)
ingredients = user['drinks']

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

