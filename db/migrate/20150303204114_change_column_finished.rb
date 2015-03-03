class ChangeColumnFinished < ActiveRecord::Migration
  def change
    change_column :lists, :finished, :boolean, default: false
  end
end
