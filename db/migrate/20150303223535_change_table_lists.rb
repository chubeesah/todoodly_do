class ChangeTableLists < ActiveRecord::Migration
  def change
    change_table :lists do |t|
      t.boolean :unfinished, default: true
    end
  end
end
