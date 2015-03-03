class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :finished
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :user_id
    end
  end
end
