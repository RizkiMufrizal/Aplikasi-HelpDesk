class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, limit: 50
      t.string :name, limit: 50
      t.string :password_hash, limit: 150
      t.string :password_salt, limit: 150
      t.boolean :enable
      t.string :role, limit: 10

      t.timestamps null: false
    end
  end
end
