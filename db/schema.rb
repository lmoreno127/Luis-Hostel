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

ActiveRecord::Schema.define(version: 2019_07_10_164724) do

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.date "check_in"
    t.date "check_out"
    t.integer "guests"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.integer "stars"
    t.string "description"
    t.date "review_date"
    t.integer "booking_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "price"
    t.boolean "is_booked"
    t.string "image"
    t.integer "max_guests"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.integer "cardnumber"
    t.string "namecard"
    t.date "expirationdate"
    t.integer "cvv"
    t.string "profile_photo"
    t.boolean "is_admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
