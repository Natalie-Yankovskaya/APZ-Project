class ChangesInWashers < ActiveRecord::Migration[5.1]
  def change
    remove_column :washers, :size_id
    add_reference :washers, :sizes, index: true
  end
end
