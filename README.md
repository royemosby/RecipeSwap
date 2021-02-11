# RecipeSwap

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
  - [ ] CANNOT
    - [X] create new recipes
    - [ ] create spinoff recipes
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
    - [ ] create spinoff recipes
    - [x] view all users
    - [x] view individual users
    - [x] view OWN account (need to complete ERB)
    - [x] edit OWN account
    - [x] logout
  - [x] CANNOT
    - [x] edit other's recipes
    - [x] delete other's recipes
    - [x] see other's account
    - [x] edit other user accounts

## Things to think about

- Should recipes be allowed to be deleted?
  - Turn ones that have spinoffs into orphans?
  - Totes delete recipes that have no spinoffs
- Should account actions be top-tier resources instead of nested under user?
