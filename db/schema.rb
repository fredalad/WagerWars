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

ActiveRecord::Schema.define(version: 20160921215759) do

  create_table "games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "platform_id"
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "game_img_file_name"
    t.string   "game_img_content_type"
    t.integer  "game_img_file_size"
    t.datetime "game_img_updated_at"
  end

  create_table "ladders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "game_id"
    t.integer  "match_player_count"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "ladder_id"
    t.integer  "chlg_team_id"
    t.string   "chlg_team_name"
    t.boolean  "chlg_team_reported"
    t.integer  "chlg_team_wins"
    t.integer  "chlg_team_losses"
    t.integer  "acpt_team_id"
    t.string   "acpt_team_name"
    t.boolean  "acpt_team_reported"
    t.integer  "acpt_team_wins"
    t.integer  "acpt_team_losses"
    t.boolean  "challange"
    t.boolean  "completed"
    t.boolean  "disputed"
    t.datetime "match_time"
    t.datetime "post_expire_time"
    t.boolean  "expired"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "best_of"
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "source_user_id"
    t.integer  "desination_user_id"
    t.string   "source_username"
    t.string   "desination_username"
    t.string   "subject"
    t.text     "body",                limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "read"
  end

  create_table "platforms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "ladder_id"
    t.string   "ladder_name"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "roster_count"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "user_id",      limit: 65535
    t.string   "leader"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "user_icon_file_name"
    t.string   "user_icon_content_type"
    t.integer  "user_icon_file_size"
    t.datetime "user_icon_updated_at"
    t.integer  "team_count"
    t.string   "username"
    t.string   "xbox_gt"
    t.string   "ps4_gt"
    t.string   "lol_summoner_name"
    t.text     "team_id",                limit: 65535
    t.string   "time_zone"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
