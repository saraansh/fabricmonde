class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :address

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
