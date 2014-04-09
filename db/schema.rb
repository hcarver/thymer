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

ActiveRecord::Schema.define(version: 20140409182508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["name"], name: "index_clients_on_name", unique: true, using: :btree
  add_index "clients", ["slug"], name: "index_clients_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "logs", force: true do |t|
    t.text     "notes"
    t.integer  "task_id"
    t.integer  "time_minutes"
    t.date     "log_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["task_id"], name: "index_logs_on_task_id", using: :btree

  create_table "outsourced_tasks", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.string   "slug"
    t.integer  "estimated_cost_pennies",    default: 0, null: false
    t.integer  "actual_cost_pennies"
    t.integer  "charged_to_client_pennies", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "outsourced_tasks", ["project_id", "name"], name: "index_outsourced_tasks_on_project_id_and_name", unique: true, using: :btree
  add_index "outsourced_tasks", ["slug"], name: "index_outsourced_tasks_on_slug", unique: true, using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "client_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "rate",       precision: 19, scale: 2
    t.decimal  "quote",      precision: 19, scale: 2
  end

  add_index "projects", ["client_id", "name"], name: "index_projects_on_client_id_and_name", unique: true, using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.string   "slug"
    t.integer  "estimated_minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",         default: false
  end

  add_index "tasks", ["project_id", "name"], name: "index_tasks_on_project_id_and_name", unique: true, using: :btree
  add_index "tasks", ["slug"], name: "index_tasks_on_slug", unique: true, using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
