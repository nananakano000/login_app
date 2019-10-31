class AddLoginCountTodayToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :login_counter_today, :integer
  end
end
