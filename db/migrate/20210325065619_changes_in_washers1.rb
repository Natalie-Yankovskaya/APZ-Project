class ChangesInWashers1 < ActiveRecord::Migration[5.1]
  def change
    remove_column :washers, :sizes_id
    add_reference :washers, :size, index: true
  end
end
