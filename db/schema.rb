# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_23_042231) do
  create_table "delivery_deadlines", force: :cascade do |t|
    t.integer "min_delivery_distance"
    t.integer "max_delivery_distance"
    t.integer "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transport_mode_id", null: false
    t.index ["transport_mode_id"], name: "index_delivery_deadlines_on_transport_mode_id"
  end

  create_table "distance_rates", force: :cascade do |t|
    t.integer "min_distance_rate"
    t.integer "max_distance_rate"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transport_mode_id", null: false
    t.index ["transport_mode_id"], name: "index_distance_rates_on_transport_mode_id"
  end

  create_table "order_freights", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "transport_mode_id"
    t.integer "final_price"
    t.integer "final_deadline"
    t.date "run_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_freights_on_order_id"
    t.index ["transport_mode_id"], name: "index_order_freights_on_transport_mode_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "code"
    t.string "pickup_address"
    t.string "pickup_zipcode"
    t.string "pickup_city"
    t.string "pickup_state"
    t.string "product_code"
    t.integer "product_dimension"
    t.integer "product_weight"
    t.string "recipient_name"
    t.string "recipient_phone"
    t.string "deliver_address"
    t.string "delivery_zipcode"
    t.string "delivery_city"
    t.string "delivery_state"
    t.integer "delivery_distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.integer "order_final_price"
    t.integer "order_final_deadline"
    t.date "order_run_date"
    t.date "order_closing_date"
    t.integer "delivery_final_status", default: 0
    t.string "justification"
    t.string "order_final_vehicle"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "transport_modes", force: :cascade do |t|
    t.string "name"
    t.integer "min_distance"
    t.integer "max_distance"
    t.integer "min_weight"
    t.integer "max_weight"
    t.integer "fixed_rate"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "license"
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.integer "max_load"
    t.integer "availability", default: 0
    t.integer "transport_mode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_mode_id"], name: "index_vehicles_on_transport_mode_id"
  end

  create_table "weight_rates", force: :cascade do |t|
    t.integer "min_weight_range"
    t.integer "max_weight_range"
    t.integer "price_kg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transport_mode_id", null: false
    t.index ["transport_mode_id"], name: "index_weight_rates_on_transport_mode_id"
  end

  add_foreign_key "delivery_deadlines", "transport_modes"
  add_foreign_key "distance_rates", "transport_modes"
  add_foreign_key "order_freights", "orders"
  add_foreign_key "order_freights", "transport_modes"
  add_foreign_key "orders", "users"
  add_foreign_key "vehicles", "transport_modes"
  add_foreign_key "weight_rates", "transport_modes"
end
