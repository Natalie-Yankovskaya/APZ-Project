class AddCity < ActiveRecord::Migration[5.1]
  def change
    add_column :laundries, :city, :string
  end
end
