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

ActiveRecord::Schema.define(version: 20140506035633) do

  create_table "battles", force: true do |t|
    t.string   "name"
    t.date     "time_start"
    t.date     "time_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "battles_hashtags", id: false, force: true do |t|
    t.integer "battle_id"
    t.integer "hashtag_id"
  end

  add_index "battles_hashtags", ["battle_id", "hashtag_id"], name: "index_battles_hashtags_on_battle_id_and_hashtag_id"

  create_table "hashtags", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count"
    t.integer  "last_tweet_id"
  end

end
