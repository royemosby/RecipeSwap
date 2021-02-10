# RecipeSwap

## TODO

- [ ] validate project specifications
- [ ] complete user views
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
  - [X] CAN
    - [X] view home
    - [X] view all recipes
    - [X] view individual recipes
    - [X] view all users
    - [X] view individual users
    - [X] attempt login
  - [ ] CANNOT
    - [ ] create new recipes
    - [ ] create spinoff recipes
    - [ ] edit any recipes (.../edit redirects to forbidden) (currently /error)
    - [ ] view user account (.../account redirects to forbidden) (currently /error)
    - [X] edit any user accounts
    - [X] log in with nonexistent username
    - [X] log in with incorrect password
  - [ ] Does NOT see
    - [ ] any edit links (verify when all views complete)
    - [ ] create new recipe (verify when all views complete)
    - [X] logout link

- [ ] Authenticated users
  - [ ] CAN
    - [X] view all recipes
    - [X] view individual recipes
    - [ ] edit OWN recipes
    - [ ] create recipes
    - [ ] create spinoff recipes
    - [X] view all users
    - [X] view individual users
    - [X] view OWN account (need to complete ERB)
    - [ ] edit OWN account (edit should maybe be ID-less so anon cannot type in link)
    - [X] logout
  - [ ] CANNOT
    - [ ] edit other's recipes
    - [ ] delete other's recipes
    - [ ] see other's account
    - [ ] edit other user accounts

## Things to think about

- Should recipes be allowed to be deleted?
  - Turn ones that have spinoffs into orphans?
  - Totes delete recipes that have no spinoffs
- Force unique usernames
- Recipe formatting- parse by step numbers or respect line breaks from editor
- Should account actions be top-tier resources instead of nested under user?
