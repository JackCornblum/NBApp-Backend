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

ActiveRecord::Schema.define(version: 2021_07_15_205646) do

  create_table "fav_players", force: :cascade do |t|
    t.integer "player_id"
    t.integer "user_id"
  end

  create_table "fav_teams", force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  create_table "my_teams", force: :cascade do |t|
    t.integer "player_id"
    t.integer "user_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "player_name"
    t.integer "team_id"
    t.string "height"
    t.string "position"
    t.integer "weight"
    t.string "teamName"
    t.string "college"
    t.string "country"
    t.string "pro"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.string "coach_name"
    t.string "tricode"
    t.string "conf_name"
  end

  create_table "user_teams", force: :cascade do |t|
    t.string "team_name"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

end
