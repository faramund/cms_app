class AddColumnToUsers < ActiveRecord::Migration
  def change
     add_column :users, :name_of_page, :string
  end
end
