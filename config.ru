require './config/environment'

use Rack::MethodOverride

use UserController
use RecipeController
run ApplicationController
