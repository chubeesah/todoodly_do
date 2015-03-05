class DropColumnFinished < ActiveRecord::Migration
  def change
    remove_column :lists, :finished
  end
end
