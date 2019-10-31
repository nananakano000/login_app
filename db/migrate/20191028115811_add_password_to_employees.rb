class AddPasswordToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :password, :string
  end
end
