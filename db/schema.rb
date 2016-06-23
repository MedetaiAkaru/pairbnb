# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160119061134) do

  create_table "listings", force: :cascade do |t|
    t.string   "location"
    t.text     "address"
    t.integer  "number_of_guests"
    t.integer  "number_of_bedrooms"
    t.integer  "number_of_bathrooms"
    t.boolean  "pets"
    t.boolean  "smoker"
    t.integer  "price"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "picture"
    t.string   "hometype"
    t.string   "roomtype"
    t.string   "number_of_beds"
    t.string   "bedtype"
    t.string   "listingname"
    t.text     "summary"
    t.string   "country"
    t.string   "city"
    t.string   "address2"
    t.string   "state"
    t.string   "zipcode"
    t.boolean  "essentials"
    t.boolean  "tv"
    t.boolean  "cabletv"
    t.boolean  "aircond"
    t.boolean  "heating"
    t.boolean  "kitchen"
    t.boolean  "internet"
    t.boolean  "wireless"
    t.boolean  "anytime"
    t.boolean  "hottub"
    t.boolean  "washer"
    t.boolean  "pool"
    t.boolean  "dryer"
    t.boolean  "breakfast"
    t.boolean  "freeparking"
    t.boolean  "gym"
    t.boolean  "elevator"
    t.boolean  "fireplace"
    t.boolean  "intercom"
    t.boolean  "doorman"
    t.boolean  "shampoo"
    t.boolean  "hangers"
    t.boolean  "hairdryer"
    t.boolean  "iron"
    t.boolean  "laptopfriendly"
    t.boolean  "familyfriendly"
    t.boolean  "smoking"
    t.boolean  "events"
    t.boolean  "petsin"
    t.boolean  "wheelchair"
    t.boolean  "smokedetector"
    t.boolean  "carbonmonoxide"
    t.boolean  "firstaid"
    t.boolean  "safetycard"
    t.boolean  "extinguisher"
    t.string   "extinguisherlocation"
    t.string   "firealarmlocation"
    t.string   "gasshutofflocation"
    t.text     "emergencyexit"
    t.string   "emergencyphone"
    t.string   "thespace"
    t.string   "guestaccess"
    t.string   "interactions"
    t.string   "otherthings"
    t.string   "houserules"
    t.string   "neighbouroverview"
    t.string   "neighbourgettingaround"
    t.string   "currency"
    t.boolean  "bookingmode"
    t.boolean  "availablemode"
    t.string   "number"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "transaction_id"
  end

  add_index "payments", ["reservation_id", "user_id"], name: "index_payments_on_reservation_id_and_user_id", unique: true

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "price"
    t.text     "specialrequest"
    t.integer  "number_of_guest"
    t.integer  "total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "encrypted_password",    limit: 128
    t.string   "confirmation_token",    limit: 128
    t.string   "remember_token",        limit: 128
    t.string   "avatar"
    t.integer  "braintree_customer_id"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
