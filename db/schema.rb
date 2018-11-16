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

ActiveRecord::Schema.define(version: 2018_11_15_163003) do

  create_table "colours", force: :cascade do |t|
    t.string "name"
    t.string "hex_colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ducks", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.integer "colour_id"
    t.integer "marking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colour_id"], name: "index_ducks_on_colour_id"
    t.index ["marking_id"], name: "index_ducks_on_marking_id"
    t.index ["owner_id"], name: "index_ducks_on_owner_id"
  end

  create_table "markings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_owners_on_api_key"
  end

end