class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character_name, null: false, unique: true
      t.timestamps null: false
    end
  end
end
