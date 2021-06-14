class Edituser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password, :string
    remove_column :users, :password_hash, :password_salt
  end
end
