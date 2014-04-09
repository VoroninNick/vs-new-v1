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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131115111419) do

  create_table "articles", :force => true do |t|
    t.boolean  "published"
    t.string   "name"
    t.text     "short_description",   :limit => 255
    t.text     "content"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.date     "original_published"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "slug"
    t.datetime "release_date"
    t.string   "author"
    t.string   "title"
  end

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "published"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "developer_roles", :force => true do |t|
    t.string   "name"
    t.integer  "developer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "developer_roles", ["developer_id"], :name => "index_developer_roles_on_developer_id"

  create_table "developers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "developer_role_id"
    t.string   "facebook_profile"
    t.string   "vkontakte_profile"
    t.string   "twitter_profile"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "portfolio_id"
  end

  add_index "developers", ["developer_role_id"], :name => "index_developers_on_developer_role_id"

  create_table "home_banner_slide_layers", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.text     "style"
    t.text     "options"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "home_banner_slide_id"
  end

  create_table "home_banner_slides", :force => true do |t|
    t.string   "name"
    t.boolean  "published"
    t.integer  "order_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "portfolio_banner_layers", :force => true do |t|
    t.string   "name"
    t.string   "style"
    t.string   "animation_options"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "portfolio_banners", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "portfolio_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.text     "title",                   :limit => 255
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
  end

  create_table "portfolio_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "slug"
    t.integer  "portfolio_id"
    t.string   "name_eng"
  end

  add_index "portfolio_categories", ["slug"], :name => "index_portfolio_categories_on_slug"

  create_table "portfolio_technologies", :force => true do |t|
    t.string   "name"
    t.string   "official_link"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "portfolio_id"
  end

  create_table "portfolios", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "portfolio_category_id"
    t.string   "slug"
    t.integer  "portfolio_banner_id"
    t.integer  "portfolio_technology_id"
    t.integer  "developer_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "result"
    t.text     "result_eng"
    t.text     "process"
    t.text     "process_eng"
    t.text     "live"
    t.text     "live_eng"
    t.date     "release"
    t.boolean  "published"
    t.text     "description"
    t.text     "thanks_to"
    t.text     "task"
    t.string   "thanks_image_file_name"
    t.string   "thanks_image_content_type"
    t.integer  "thanks_image_file_size"
    t.string   "thanks_image_updated_at"
  end

  add_index "portfolios", ["slug"], :name => "index_portfolios_on_slug"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "services", :force => true do |t|
    t.boolean  "published"
    t.string   "name"
    t.text     "short_description"
    t.text     "full_description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "sort_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "trust_companies", :force => true do |t|
    t.boolean  "published"
    t.string   "name"
    t.string   "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "url"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
