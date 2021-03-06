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

ActiveRecord::Schema.define(version: 20170222191818) do

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
    t.integer  "min_player_count"
    t.integer  "max_player_count"
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
    t.boolean  "accepted"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "best_of"
    t.text     "setting_id",                 limit: 65535
    t.boolean  "mlg_rules"
    t.boolean  "acpt_team_dispute_reported"
    t.boolean  "chlg_team_dispute_reported"
    t.integer  "ticket_id"
    t.integer  "game_id"
    t.boolean  "ladder_match"
    t.boolean  "tournament_match"
    t.integer  "tournament_id"
    t.integer  "next_match_id"
    t.integer  "match_player_count"
    t.text     "acpt_player_names",          limit: 65535
    t.text     "chlg_player_names",          limit: 65535
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "source_user_id"
    t.integer  "destination_user_id"
    t.string   "source_username"
    t.string   "destination_username"
    t.string   "subject"
    t.text     "body",                 limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "read"
    t.boolean  "team_invite"
  end

  create_table "platforms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "ladder_id"
    t.boolean  "mlg_rules"
    t.string   "map_name"
    t.string   "game_type"
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
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "user_id",          limit: 65535
    t.string   "leader"
    t.integer  "game_id"
    t.integer  "min_player_count"
    t.integer  "max_player_count"
    t.text     "username",         limit: 65535
  end

  create_table "tickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "match_id"
    t.string   "chlg_team_name"
    t.integer  "chlg_team_id"
    t.string   "acpt_team_name"
    t.integer  "acpt_team_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "completed"
    t.string   "acpt_team_img1_file_name"
    t.string   "acpt_team_img1_content_type"
    t.integer  "acpt_team_img1_file_size"
    t.datetime "acpt_team_img1_updated_at"
    t.string   "acpt_team_img2_file_name"
    t.string   "acpt_team_img2_content_type"
    t.integer  "acpt_team_img2_file_size"
    t.datetime "acpt_team_img2_updated_at"
    t.string   "acpt_team_img3_file_name"
    t.string   "acpt_team_img3_content_type"
    t.integer  "acpt_team_img3_file_size"
    t.datetime "acpt_team_img3_updated_at"
    t.string   "acpt_team_img4_file_name"
    t.string   "acpt_team_img4_content_type"
    t.integer  "acpt_team_img4_file_size"
    t.datetime "acpt_team_img4_updated_at"
    t.string   "acpt_team_img5_file_name"
    t.string   "acpt_team_img5_content_type"
    t.integer  "acpt_team_img5_file_size"
    t.datetime "acpt_team_img5_updated_at"
    t.string   "chlg_team_img1_file_name"
    t.string   "chlg_team_img1_content_type"
    t.integer  "chlg_team_img1_file_size"
    t.datetime "chlg_team_img1_updated_at"
    t.string   "chlg_team_img2_file_name"
    t.string   "chlg_team_img2_content_type"
    t.integer  "chlg_team_img2_file_size"
    t.datetime "chlg_team_img2_updated_at"
    t.string   "chlg_team_img3_file_name"
    t.string   "chlg_team_img3_content_type"
    t.integer  "chlg_team_img3_file_size"
    t.datetime "chlg_team_img3_updated_at"
    t.string   "chlg_team_img4_file_name"
    t.string   "chlg_team_img4_content_type"
    t.integer  "chlg_team_img4_file_size"
    t.datetime "chlg_team_img4_updated_at"
    t.string   "chlg_team_img5_file_name"
    t.string   "chlg_team_img5_content_type"
    t.integer  "chlg_team_img5_file_size"
    t.datetime "chlg_team_img5_updated_at"
  end

  create_table "tournaments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "team_count"
    t.string   "game_name"
    t.integer  "game_id"
    t.decimal  "cash_prize",         precision: 8, scale: 2
    t.datetime "start_time"
    t.integer  "match_player_count"
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
