class UpdateCatAddIndices < ActiveRecord::Migration
  def change

    add_column :categories, :super, :string
    add_index :ratings, :category_id
    add_index :ratings, :winner_id
    add_index :ratings, :loser_id
    add_index :ratings, :user_id
  end
end
