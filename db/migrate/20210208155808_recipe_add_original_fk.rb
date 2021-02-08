class RecipeAddOriginalFk < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.references :original
    end
  end
end
