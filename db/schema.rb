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

ActiveRecord::Schema[7.0].define(version: 2022_07_04_152711) do
  create_table "catagories", force: :cascade do |t|
    t.bigint "author_id"
    t.string "name"
    t.string "icon"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["author_id"], name: "index_catagories_on_author_id"
  end

  create_table "catagories_payments", id: false, force: :cascade do |t|
    t.bigint "catagory_id"
    t.bigint "payment_id"
    t.index ["catagory_id"], name: "index_catagories_payments_on_catagory_id"
    t.index ["payment_id"], name: "index_catagories_payments_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "author_id"
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["author_id"], name: "index_payments_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "catagories", "users", column: "author_id"
  add_foreign_key "catagories_payments", "catagories"
  add_foreign_key "catagories_payments", "payments"
  add_foreign_key "payments", "users", column: "author_id"
end
