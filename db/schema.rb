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

ActiveRecord::Schema.define(version: 2024_04_15_150941) do

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "earthquake_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["earthquake_event_id"], name: "index_comments_on_earthquake_event_id"
  end

  create_table "earthquake_events", force: :cascade do |t|
    t.string "external_id"
    t.float "magnitude"
    t.string "place"
    t.bigint "time"
    t.string "url"
    t.boolean "tsunami"
    t.string "mag_type"
    t.string "type_feature"
    t.string "title"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
