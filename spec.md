# Project Requirements

## Specs

- [X] Use Sinatra to build the app: Listed in Gemfile and app is centered around routes
- [X] Use ActiveRecord for storing information in a database: Listed in Gemfile, used migrations to create tables and associations are established in models classes
- [X] Include more than one model class: Project contains User and Recipe classes
- [X] Include at least one `has_many` relationship on your User model: User has many Recipes and Recipe(original) has many Recipes(spinoff)
- [X] Include at least one `belongs_to` relationship on another model (e.g. Post belongs_to User): Recipe belongs to User, Recipe(spinoff) belongs to Recipe(original)
- [X] Include user accounts with unique login attribute: username is indexed with unique flag set to true and conditional logic in `post /users` looks for existing username before creating new record/object
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: TODO: Recipe stuff
- [X] Ensure that users can't modify content created by other users: Accounts can't be tampered with and private info is not viewable. All 'get' routes with forms validate user is at least logged on and shows non-authenticated users an error page with flash message.
- [ ] Include user input validations: Forces unique username. Requires password re-entry when updating account info. Validates users are logged in for post routes and own resources they are attempting to patch.
- [X] BONUS - not required - Display validation failures to user with error message: using flash
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

## Confirm

- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
