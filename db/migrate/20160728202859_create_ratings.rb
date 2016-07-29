class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :category_id, null: false
      t.integer :winner_id, null:false
      t.integer :loser_id, null:false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
