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

ActiveRecord::Schema.define(version: 20150104032627) do

  create_table "blocks", force: :cascade do |t|
    t.text     "body",               limit: 65535
    t.string   "label",              limit: 255
    t.string   "path",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.boolean  "accepts_image",      limit: 1,     default: false
    t.string   "image_fingerprint",  limit: 255
  end

  add_index "blocks", ["label"], name: "index_blocks_on_label", using: :btree

  create_table "discography_entries", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "permalink",          limit: 255
    t.text     "description",        limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "image_fingerprint",  limit: 255
    t.integer  "sort_order",         limit: 4,     default: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "discography_entries", ["permalink"], name: "index_discography_entries_on_permalink", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.datetime "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "image_fingerprint",  limit: 255
  end

  add_index "events", ["starts_at"], name: "index_events_on_starts_at", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "label",             limit: 255
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.string   "file_fingerprint",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",            limit: 1,   default: true
    t.integer  "sort_order",        limit: 4
  end

  add_index "images", ["active"], name: "index_images_on_active", using: :btree
  add_index "images", ["sort_order"], name: "index_images_on_sort_order", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "url",         limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order",  limit: 4
    t.boolean  "project",     limit: 1,     default: false
  end

  add_index "links", ["project"], name: "index_links_on_project", using: :btree
  add_index "links", ["sort_order"], name: "index_links_on_sort_order", using: :btree

  create_table "medias", force: :cascade do |t|
    t.string   "label",             limit: 255
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "body",               limit: 65535
    t.string   "permalink",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "image_fingerprint",  limit: 255
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.text     "description",      limit: 65535
    t.integer  "sort_order",       limit: 4
    t.boolean  "active",           limit: 1,     default: true
    t.string   "mp3_file_name",    limit: 255
    t.string   "mp3_content_type", limit: 255
    t.integer  "mp3_file_size",    limit: 4
    t.datetime "mp3_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["active"], name: "index_tracks_on_active", using: :btree
  add_index "tracks", ["sort_order"], name: "index_tracks_on_sort_order", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",      limit: 255
    t.string   "password_hash", limit: 255
    t.string   "name",          limit: 255
    t.string   "email",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
