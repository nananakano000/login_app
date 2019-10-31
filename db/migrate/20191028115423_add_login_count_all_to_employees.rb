class AddLoginCountAllToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :login_counter_all, :integer
  end
end
