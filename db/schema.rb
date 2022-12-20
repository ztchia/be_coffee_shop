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

ActiveRecord::Schema[7.0].define(version: 2022_12_20_145138) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combo_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "combo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["combo_id"], name: "index_combo_items_on_combo_id"
    t.index ["item_id"], name: "index_combo_items_on_item_id"
  end

  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.float "discount"
    t.integer "discounted_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "contact"
    t.text "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.float "cost"
    t.float "price", null: false
    t.float "profit"
    t.integer "category"
    t.bigint "menu_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_items_on_menu_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "menus", force: :cascade do |t|
    t.string "version", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_menus_on_store_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.boolean "sent"
    t.bigint "order_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_notifications_on_customer_id"
    t.index ["order_id"], name: "index_notifications_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", default: 0
    t.jsonb "details", default: 0
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.jsonb "tax_rates"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "payments", force: :cascade do |t|
    t.float "amount"
    t.string "currency", default: "USD"
    t.integer "status", default: 0
    t.bigint "order_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_payments_on_customer_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.integer "kind", default: 0
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.integer "kind"
    t.float "rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "combo_items", "combos"
  add_foreign_key "combo_items", "items"
  add_foreign_key "customers", "users"
  add_foreign_key "items", "menus"
  add_foreign_key "menus", "stores"
  add_foreign_key "notifications", "customers"
  add_foreign_key "notifications", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "stores"
  add_foreign_key "payments", "customers"
  add_foreign_key "payments", "orders"
end
