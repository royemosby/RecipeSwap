class RecipeAddOriginalFk < ActiveRecord::Migration[6.1]
  def change
    change_table :recipes do |t|
      t.references :original
    end
  end
end
