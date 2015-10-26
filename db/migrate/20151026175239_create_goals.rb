class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description
      t.boolean :private, default: false
      t.boolean :completed, default: false

      t.timestamps null: false
    end

    add_index :goals, :user_id
    add_foreign_key :goals, :users
  end
end
