class AddBreakdowns < ActiveRecord::Migration[5.1]
  def change
    create_table :breakdowns do |t|
      t.belongs_to :washer
      t.string :urgency
      t.boolean :taken
      t.boolean :status
      t.string :comment
    end

    create_table :repairers do |t|
      t.string :name
      t.string :surname
      t.string :phonenumber
    end

    create_table :repairs do |t|
      t.belongs_to :breakdown
      t.belongs_to :repairer
      t.date :date
      t.float :price
      t.boolean :status
    end
  end
end
