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

ActiveRecord::Schema.define(version: 20160608074426) do

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

  create_table "entities", force: :cascade do |t|
    t.string   "name"
    t.string   "entity_logo"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "website"
    t.string   "bio"
    t.string   "city"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "manifest_support"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "event_header_picture"
    t.string   "event_body_picture"
    t.string   "short_description"
    t.text     "long_description"
    t.datetime "daytime"
    t.text     "attendance_requirements"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "venue_id"
  end

  add_index "events", ["venue_id"], name: "index_events_on_venue_id"

  create_table "organizings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "organizings", ["event_id"], name: "index_organizings_on_event_id"
  add_index "organizings", ["user_id"], name: "index_organizings_on_user_id"

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
    t.string   "region"
    t.string   "link"
  end

  add_index "promos", ["name"], name: "index_promos_on_name", unique: true

  create_table "sponsorships", force: :cascade do |t|
    t.integer  "sponsor_id",   null: false
    t.integer  "event_id",     null: false
    t.string   "sponsor_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "sponsorships", ["event_id"], name: "index_sponsorships_on_event_id"
  add_index "sponsorships", ["sponsor_id", "event_id", "sponsor_type"], name: "index_sponsorships_on_sponsor_id_and_event_id_and_sponsor_type"
  add_index "sponsorships", ["sponsor_id"], name: "index_sponsorships_on_sponsor_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "bio"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "website"
    t.string   "avatar"
    t.boolean  "manifest_support"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

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
