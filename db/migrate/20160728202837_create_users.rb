class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true
      t.boolean :admin
      t.timestamps null: false
    end
  end
end
