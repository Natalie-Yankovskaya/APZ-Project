class Adduser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :phonenumber
      t.string :email
      t.string :password
      t.string :role
    end
  end
end
