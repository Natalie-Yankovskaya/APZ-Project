# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210531081210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breakdowns", force: :cascade do |t|
    t.bigint "washer_id"
    t.string "urgency"
    t.boolean "taken"
    t.boolean "status"
    t.string "comment"
    t.index ["washer_id"], name: "index_breakdowns_on_washer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phonenumber"
  end

  create_table "laundries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
  end

  create_table "modes", force: :cascade do |t|
    t.string "name"
    t.integer "minutes"
    t.float "price"
  end

  create_table "repairers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phonenumber"
  end

  create_table "repairs", force: :cascade do |t|
    t.bigint "breakdown_id"
    t.bigint "repairer_id"
    t.date "date"
    t.float "price"
    t.boolean "status"
    t.index ["breakdown_id"], name: "index_repairs_on_breakdown_id"
    t.index ["repairer_id"], name: "index_repairs_on_repairer_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "washing_id"
    t.bigint "mode_id"
    t.boolean "washing_powder"
    t.boolean "conditioner"
    t.index ["mode_id"], name: "index_services_on_mode_id"
    t.index ["washing_id"], name: "index_services_on_washing_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.integer "max_load"
    t.float "price"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "password_digest"
  end

  create_table "washers", force: :cascade do |t|
    t.bigint "laundry_id"
    t.string "serial_number"
    t.string "firm"
    t.string "model"
    t.string "status"
    t.integer "number_of_programs"
    t.bigint "size_id"
    t.index ["laundry_id"], name: "index_washers_on_laundry_id"
    t.index ["size_id"], name: "index_washers_on_size_id"
  end

  create_table "washings", force: :cascade do |t|
    t.bigint "washer_id"
    t.bigint "customer_id"
    t.string "status"
    t.integer "remaining_time"
    t.integer "password"
    t.index ["customer_id"], name: "index_washings_on_customer_id"
    t.index ["washer_id"], name: "index_washings_on_washer_id"
  end

  create_table "workers", force: :cascade do |t|
    t.bigint "laundry_id"
    t.string "name"
    t.string "surname"
    t.string "phonenumber"
    t.index ["laundry_id"], name: "index_workers_on_laundry_id"
  end

end
