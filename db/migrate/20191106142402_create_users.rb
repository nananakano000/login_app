class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :password
      t.string :user_name
      t.integer :login_counter_today
      t.integer :login_counter_all
      t.date :last_login_date

      t.timestamps
    end
  end
end
