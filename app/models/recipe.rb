class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :spinoffs, class_name: "Recipe", foreign_key: "original_id"
  belongs_to :original, class_name: "Recipe"
end