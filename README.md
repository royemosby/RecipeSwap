# RecipeSwap

## TOC

- About
- How to install (on local system)
- Contributor's guide
- License

## About RecipeSwap

RecipeSwap allows users to browse, curate, and spin off recipes. Pinterest and browser bookmarks are lovely way to curate recipes from online locations but they have one serious drawback. There is no way to tweak that recipe. Whether your an onion lover, vegan, fan of fusion, or just seriously opinionated about flavors, this tool will allow you to tweak the recipes you curate to meet your own personal preferences.

With RecipeSwap you are be able to:

- Browse the communitiy's recipes.
- Mark recipes as favorites for easy reference.
- Spin off recipes to make them your own.
- Publish you own recipes to share with the RecipeSwap community.

RecipeSwap is built with love in Ruby using Sinatra and ActiveRecord.

## How to install (on local system)

1. Download or clone this repo.
2. Open terminal to the top level directory of this project and type `bundle install`
3. Type `rake db:migrate` to install the sqlite database (will be found in /db)
4. Populate database with starter content by typing `rake db:seed`.
5. Start the shotgun server by typing `shotgun`
6. Open `localhost:9393` in a new browser window and start interacting with RecipeSwap!

## Contributor's guide

Bottom line: I will be a kind human. Please be the same in return.

Please submit a contribution idea through an issue ticket before working on a pull request. Don't submit a pull request unless it has been discussed through an issue ticket. I happily respond to all contructive inquiries.

As this project evolves, I will update this readme and how contributions are accepted.

## This project uses the [standard MIT license](LICENSE)
