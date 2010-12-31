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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101212041459) do

  create_table "blocks", :force => true do |t|
    t.text     "body"
    t.string   "label"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "accepts_image",      :default => false
    t.string   "image_fingerprint"
  end

  add_index "blocks", ["label"], :name => "index_blocks_on_label"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_fingerprint"
  end

  add_index "events", ["starts_at"], :name => "index_events_on_starts_at"

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "image"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["sort_order"], :name => "index_galleries_on_sort_order"

  create_table "images", :force => true do |t|
    t.string   "label"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "file_fingerprint"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",            :default => true
    t.integer  "sort_order"
    t.integer  "gallery_id"
  end

  add_index "images", ["active"], :name => "index_images_on_active"
  add_index "images", ["gallery_id"], :name => "index_images_on_gallery_id"
  add_index "images", ["sort_order"], :name => "index_images_on_sort_order"

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
  end

  add_index "links", ["sort_order"], :name => "index_links_on_sort_order"

  create_table "medias", :force => true do |t|
    t.string   "label"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_fingerprint"
  end

  create_table "tracks", :force => true do |t|
    t.string   "title"
    t.date     "recorded_at"
    t.text     "description"
    t.integer  "sort_order"
    t.boolean  "active",           :default => true
    t.string   "mp3_file_name"
    t.string   "mp3_content_type"
    t.integer  "mp3_file_size"
    t.datetime "mp3_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["active"], :name => "index_tracks_on_active"
  add_index "tracks", ["sort_order"], :name => "index_tracks_on_sort_order"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
