class AddUserNameToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :user_name, :string
  end
end
