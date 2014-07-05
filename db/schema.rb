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

ActiveRecord::Schema.define(version: 20140705211701) do

  create_table "benchmark_results", force: true do |t|
    t.string   "category"
    t.string   "name"
    t.integer  "iterations_count"
    t.decimal  "average_duration"
    t.decimal  "max_duration"
    t.decimal  "min_duration"
    t.integer  "timestamp",        limit: 8
    t.string   "julia_sha"
    t.string   "julia_version"
    t.text     "code"
    t.integer  "num_cores"
    t.text     "environment_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "snippet_id"
  end

  add_index "benchmark_results", ["snippet_id"], name: "index_benchmark_results_on_snippet_id"

  create_table "snippets", force: true do |t|
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_snippet_id"
    t.integer  "user_id"
    t.string   "public_token"
  end

  add_index "snippets", ["parent_snippet_id"], name: "index_snippets_on_parent_snippet_id"
  add_index "snippets", ["public_token"], name: "index_snippets_on_public_token", unique: true
  add_index "snippets", ["user_id"], name: "index_snippets_on_user_id"

  create_table "users", force: true do |t|
    t.string   "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
