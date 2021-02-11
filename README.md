# RecipeSwap

RecipeSwap allows users to browse, curate, and spin off recipes. Pinterest and browser bookmarks are lovely way to curate recipes from online locations but they have one serious drawback. There is no way to tweak that recipe. Whether your an onion lover, vegan, fan of fusion, or just seriously opinionated about flavors, this tool will allow you to tweak the recipes you curate to meet your own personal preferences.

You will be able to:

- Browse all the recipes published
- Save recipes to your cookbook
- Spin off saved recipes to make it your own (make an editable coppy, wOOT)
- Publish you own recipes to share

## TODO

- [ ] validate project specifications
- [x] complete user views
- [ ] complete recipe views
- [ ] validate user tasks/limitations
- [ ] flash messaging on create, edit, spinoff, errors
- [ ] custom 404.erb
- [ ] about.erb
- [ ] README
- [ ] secure session_secret (see app controller config)
- [ ] finalize styling
- [ ] favicon
- [ ] blog post
  - [ ] topic
  - [ ] draft
  - [ ] post
- [ ] walk-through video
- [ ] submit project

## Validate user tasks/limitations

- [ ] Anonymous users
  - [x] CAN
    - [x] view home
    - [x] view all recipes
    - [x] view individual recipes
    - [x] view all users
    - [x] view individual users
    - [x] attempt login
  - [x] CANNOT
    - [X] create new recipes
    - [x] create spinoff recipes
    - [x] edit any recipes
    - [x] view user account
    - [x] edit any user accounts
    - [x] log in with nonexistent username
    - [x] log in with incorrect password
    - [x] create account with existing username
  - [ ] Does NOT see
    - [ ] any edit links (verify when all views complete)
    - [ ] create new recipe (verify when all views complete)
    - [x] logout link

- [ ] Authenticated users
  - [ ] CAN
    - [x] view all recipes
    - [x] view individual recipes
    - [x] edit OWN recipes
    - [x] create recipes
    - [x] create spinoff recipes
    - [x] view all users
    - [x] view individual users
    - [x] view OWN account (need to complete ERB)
    - [x] edit OWN account
    - [x] logout
    - [ ] collect recipes (favorite)
  - [x] CANNOT
    - [x] edit other's recipes
    - [x] delete other's recipes
    - [x] see other's account
    - [x] edit other user accounts

## Things to think about

- Should recipes be allowed to be deleted?
  - Turn ones that have spinoffs into orphans?
  - Totes delete recipes that have no spinoffs
