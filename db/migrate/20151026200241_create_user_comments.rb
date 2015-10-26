class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :body, null: false
      t.integer :author_id, null: false
      t.integer :profile_id, null: false

      t.timestamps null: false
    end
    add_index :user_comments, :author_id
    add_index :user_comments, :profile_id
  end
end
