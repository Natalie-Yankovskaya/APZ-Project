class AddTableSize < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.integer :max_load
      t.float :price
    end

    remove_column :washers, :max_load
    remove_column :washers, :price

    add_column :washers, :size_id , :integer, :references => 'sizes'


  end
end
