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
  - [x] CAN
    - [x] view home
    - [x] view all recipes
    - [x] view individual recipes
    - [x] view all users
    - [x] view individual users
    - [x] attempt login
  - [ ] CANNOT
    - [ ] create new recipes
    - [ ] create spinoff recipes
    - [ ] edit any recipes (.../edit redirects to forbidden) (currently /error)
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
    - [ ] edit OWN recipes
    - [ ] create recipes
    - [ ] create spinoff recipes
    - [x] view all users
    - [x] view individual users
    - [x] view OWN account (need to complete ERB)
    - [x] edit OWN account
    - [x] logout
  - [ ] CANNOT
    - [ ] edit other's recipes
    - [ ] delete other's recipes
    - [x] see other's account
    - [x] edit other user accounts

## Things to think about

- Should recipes be allowed to be deleted?
  - Turn ones that have spinoffs into orphans?
  - Totes delete recipes that have no spinoffs
- Force unique usernames
- Recipe formatting- parse by step numbers or respect line breaks from editor
- Should account actions be top-tier resources instead of nested under user?
