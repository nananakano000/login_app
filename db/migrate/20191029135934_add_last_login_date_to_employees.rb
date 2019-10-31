class AddLastLoginDateToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :last_login_date, :date
  end
end
