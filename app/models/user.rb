class User <ActiveRecord::Base
  has_many :recipes
  has_many :collector_favorites, foreign_key: "collector_id"
  has_many :favorites, class_name: "Recipe", through: :collector_favorites
  has_secure_password
end