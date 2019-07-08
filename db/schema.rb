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

ActiveRecord::Schema.define(version: 2019_07_08_171749) do

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.date "check_in"
    t.date "check_out"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.string "description"
    t.date "review_date"
    t.integer "booking_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "image"
    t.string "description"
    t.float "price"
    t.boolean "is_booked"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "cardnumber"
    t.string "namecard"
    t.date "expirationdate"
    t.integer "cvv"
    t.string "profile_photo"
    t.boolean "is_admin"
  end

end