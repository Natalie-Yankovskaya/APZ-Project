class AddTables < ActiveRecord::Migration[5.1]
  def change

    create_table :laundries do |t|
      t.string :name
      t.string :address
    end

    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.string :phonenumber
    end

    create_table :workers do |t|
      t.belongs_to :laundry
      t.string :name
      t.string :surname
      t.string :phonenumber
    end

    create_table :washers do |t|
      t.belongs_to :laundry
      t.string :serial_number
      t.string :firm
      t.string :model
      t.string :status
      t.integer :max_load
      t.integer :number_of_programs
      t.float :price
    end

    create_table :modes do |t|
      t.string :name
      t.integer :minutes
      t.float :price
    end

    create_table :washings do |t|
      t.belongs_to :washer
      t.belongs_to :customer
      t.string :status
      t.integer :remaining_time
      t.integer :password
    end

    create_table :services do |t|
      t.belongs_to :washing
      t.belongs_to :mode
      t.boolean :washing_powder
      t.boolean :conditioner
    end

  end
end
