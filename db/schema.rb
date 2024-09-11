# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_10_143521) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "_prisma_migrations", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.string "checksum", limit: 64, null: false
    t.timestamptz "finished_at"
    t.string "migration_name", limit: 255, null: false
    t.text "logs"
    t.timestamptz "rolled_back_at"
    t.timestamptz "started_at", default: -> { "now()" }, null: false
    t.integer "applied_steps_count", default: 0, null: false
  end

  create_table "account", id: :serial, force: :cascade do |t|
    t.text "username", null: false
    t.datetime "created_at", precision: 3, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 3, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["username"], name: "account_username_key", unique: true
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment", id: :serial, force: :cascade do |t|
    t.text "comment", null: false
    t.integer "commenter_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 3, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 3, null: false
    t.boolean "is_deleted", default: false, null: false
    t.index ["id"], name: "comment_id_key", unique: true
  end

  create_table "community", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.datetime "created_at", precision: 3, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 3, null: false
    t.boolean "is_deleted", default: false, null: false
    t.index ["id"], name: "community_id_key", unique: true
    t.index ["name"], name: "community_name_key", unique: true
  end

  create_table "post", id: :serial, force: :cascade do |t|
    t.string "title", limit: 50, null: false
    t.string "content", limit: 500, null: false
    t.integer "community_id", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", precision: 3, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 3, null: false
    t.boolean "is_deleted", default: false, null: false
    t.index ["id"], name: "post_id_key", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comment", "account", column: "commenter_id", name: "comment_commenter_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "comment", "post", name: "comment_post_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "post", "account", column: "author_id", name: "post_author_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "post", "community", name: "post_community_id_fkey", on_update: :cascade, on_delete: :restrict
end
