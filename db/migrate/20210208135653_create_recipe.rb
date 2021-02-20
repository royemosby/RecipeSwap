class CreateRecipe < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string    :name
      t.string    :description
      t.string    :ingredients
      t.string    :instructions
      t.integer   :servings
      t.integer   :user_id #author
      t.datetime  :created_at
      t.datetime  :updated_at
    end
  end
end