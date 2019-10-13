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

ActiveRecord::Schema.define(version: 2019_10_13_092822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "reserved"
    t.datetime "start_at"
    t.bigint "yatch_id"
    t.integer "number_of_guest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["yatch_id"], name: "index_activities_on_yatch_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "beverage_id"
    t.string "localisation"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_at"
    t.index ["beverage_id"], name: "index_baskets_on_beverage_id"
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "beverages", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "quantity", default: 0
    t.integer "beverage_type", default: 0
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_beverages_on_booking_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "yatch_id"
    t.date "start_at"
    t.date "end_at"
    t.integer "rating"
    t.text "captain_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["yatch_id"], name: "index_bookings_on_yatch_id"
  end

  create_table "brokers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_chatrooms_on_booking_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.bigint "menu_id"
    t.string "name"
    t.text "description"
    t.integer "dish_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_dishes_on_menu_id"
  end

  create_table "guest_informations", force: :cascade do |t|
    t.bigint "user_id"
    t.date "birth_date"
    t.string "passport_number"
    t.string "nationality", default: ""
    t.string "mobile_number"
    t.string "charter_yatch"
    t.date "arrival_date"
    t.date "departure_date"
    t.integer "number_of_guests", default: 1
    t.string "flight_number", default: ""
    t.boolean "collecting_at_airport", default: false
    t.boolean "in_hotel", default: false
    t.string "hotel_name", default: ""
    t.boolean "completed", default: false
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_guest_informations_on_user_id"
  end

  create_table "guest_preferences", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "shoe_size"
    t.integer "height"
    t.integer "weight"
    t.text "character"
    t.text "specific_request"
    t.text "interest"
    t.text "medical_details"
    t.text "food_preference"
    t.text "beverage_preference"
    t.text "alcohol_preference"
    t.text "wine"
    t.boolean "flower", default: false
    t.boolean "newspaper", default: false
    t.string "newspaper_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "allergy"
    t.string "dislike"
    t.index ["user_id"], name: "index_guest_preferences_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.bigint "booking_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_menus_on_booking_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "chatroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "beverage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beverage_id"], name: "index_orders_on_beverage_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "tenders", force: :cascade do |t|
    t.bigint "yatch_id"
    t.datetime "time"
    t.integer "called", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["yatch_id"], name: "index_tenders_on_yatch_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "crew", default: false
    t.boolean "guest", default: false
    t.integer "role"
    t.string "name"
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_users_on_booking_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yatches", force: :cascade do |t|
    t.string "yatch_name"
    t.string "photo"
    t.string "room"
    t.string "localisation"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "yatches"
  add_foreign_key "baskets", "beverages"
  add_foreign_key "baskets", "users"
  add_foreign_key "beverages", "bookings"
  add_foreign_key "bookings", "yatches"
  add_foreign_key "chatrooms", "bookings"
  add_foreign_key "dishes", "menus"
  add_foreign_key "guest_informations", "users"
  add_foreign_key "guest_preferences", "users"
  add_foreign_key "menus", "bookings"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "beverages"
  add_foreign_key "orders", "users"
  add_foreign_key "tenders", "yatches"
  add_foreign_key "users", "bookings"
end
