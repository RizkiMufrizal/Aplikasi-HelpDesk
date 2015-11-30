class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title, limit: 30
      t.string :description, limit: 150
      t.string :picture, limit: 150
      t.string :status, limit: 30

      t.timestamps null: false
    end
  end
end
