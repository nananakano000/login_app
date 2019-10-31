class RemoveDepartmentFromEmployees < ActiveRecord::Migration[6.0]
  def change

    remove_column :employees, :department, :string
    remove_column :employees, :gender, :integer
    remove_column :employees, :payment, :integer
  end
end
