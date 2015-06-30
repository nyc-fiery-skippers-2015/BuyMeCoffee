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

ActiveRecord::Schema.define(version: 20150630203841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basic_profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "maiden_name"
    t.string   "formatted_name"
    t.string   "headline"
    t.string   "location"
    t.string   "industry"
    t.string   "summary"
    t.string   "specialties"
    t.string   "picture_url"
    t.string   "public_profile_url"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "topic",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_users", force: :cascade do |t|
    t.integer "user_id",     null: false
    t.integer "category_id", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "mentor_id",                   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "status",      default: false
    t.integer  "user_id"
    t.string   "question",                    null: false
    t.string   "agreed_time"
    t.string   "location"
  end

  create_table "linkedin_oauth_settings", force: :cascade do |t|
    t.string   "atoken"
    t.string   "asecret"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "title"
    t.string   "summary"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_current"
    t.string   "company"
    t.integer  "basic_profile_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.integer  "rating",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "mentor_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "about",                           null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "status",          default: false
    t.string   "password_digest"
    t.string   "email"
    t.string   "linkedin"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "image_url"
  end

end
