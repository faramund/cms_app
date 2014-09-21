class AddIndexToNameOfPage < ActiveRecord::Migration
  def change
    add_index :users, :name_of_page, unique: true
  end
end
