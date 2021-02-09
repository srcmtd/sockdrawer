# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_01_034106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "account_login_change_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "login", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_password_hashes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "password_hash", null: false
  end

  create_table "account_password_reset_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "account_remember_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_verification_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.datetime "requested_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.citext "email", null: false
    t.string "status", default: "unverified", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true, where: "((status)::text = ANY ((ARRAY['unverified'::character varying, 'verified'::character varying])::text[]))"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "socks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.date "birthday"
    t.text "interests"
    t.text "skills"
    t.text "languages"
    t.string "operating_system"
    t.string "mobile_device"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "marked_dirty_at"
    t.string "email"
    t.text "notes"
  end

  add_foreign_key "account_login_change_keys", "accounts", column: "id"
  add_foreign_key "account_password_hashes", "accounts", column: "id"
  add_foreign_key "account_password_reset_keys", "accounts", column: "id"
  add_foreign_key "account_remember_keys", "accounts", column: "id"
  add_foreign_key "account_verification_keys", "accounts", column: "id"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
