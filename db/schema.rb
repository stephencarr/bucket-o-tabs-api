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

ActiveRecord::Schema.define(version: 20161218223909) do

  create_table "links", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "title",                  limit: 65535
    t.json     "images"
    t.string   "url"
    t.string   "digest"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "description",            limit: 65535
    t.string   "image_og_file_name"
    t.string   "image_og_content_type"
    t.integer  "image_og_file_size"
    t.datetime "image_og_updated_at"
    t.string   "image_fav_file_name"
    t.string   "image_fav_content_type"
    t.integer  "image_fav_file_size"
    t.datetime "image_fav_updated_at"
    t.index ["url"], name: "index_links_on_url", using: :btree
  end

  create_table "links_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "link_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_links_users_on_link_id", using: :btree
    t.index ["user_id"], name: "index_links_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider",                             default: "email", null: false
    t.string   "uid",                                  default: "",      null: false
    t.string   "encrypted_password",                   default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens",                 limit: 65535
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
