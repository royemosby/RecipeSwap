class CreateCollectorFavorites < ActiveRecord::Migration
  def change
    create_table :collector_favorites do |t|
      t.integer :collector_id, foreign_key: {to_table: 'users'}
      t.integer :favorite_id, foreign_key: {to_table: 'recipes'}
    end
  end
end
