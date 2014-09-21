class ChangeColumnNameOfPage < ActiveRecord::Migration
  def change
    change_column :users, :name_of_page, :string, :default => "", :null => false
  end
end
