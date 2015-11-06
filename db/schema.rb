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

ActiveRecord::Schema.define(version: 20151104181625) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizings", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "promo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categorizings", ["category_id"], name: "index_categorizings_on_category_id"
  add_index "categorizings", ["promo_id"], name: "index_categorizings_on_promo_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "city"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "website"
    t.string   "twitter"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "province"
    t.string   "address"
    t.string   "country"
    t.string   "logo"
    t.string   "featured_picture"
    t.string   "facebook"
  end

  create_table "promos", force: :cascade do |t|
    t.string   "promo_logo"
    t.string   "name"
    t.string   "brief_product_description"
    t.string   "brief_promo_description"
    t.text     "long_product_description"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "website"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "accessibility_options"
    t.text     "about_the_promo"
    t.text     "promo_requirements"
    t.string   "promo_featured_picture"
  end

  add_index "promos", ["name"], name: "index_promos_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "venue_picture"
    t.string   "website"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.text     "accessibility"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "phone"
  end

end
