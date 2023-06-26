class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :type_of_departure, :string
    add_column :users, :date_of_integration, :date
    add_column :users, :date_of_departure, :date
  end
end
