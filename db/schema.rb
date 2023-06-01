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

ActiveRecord::Schema[7.0].define(version: 2023_06_01_115449) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "nip"
    t.integer "company_type"
    t.string "phone"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_customer_id", null: false
    t.index ["company_customer_id"], name: "index_companies_on_company_customer_id"
  end

  create_table "company_customers", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_customers_on_company_id"
    t.index ["customer_id"], name: "index_company_customers_on_customer_id"
  end

  create_table "company_users", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "country"
    t.string "voivodeship"
    t.string "city"
    t.string "post_code"
    t.string "phone"
    t.string "company"
    t.string "nip"
    t.integer "customer_type"
    t.string "personal_number"
    t.integer "discount"
    t.string "identity_card"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_customer_id", null: false
    t.index ["company_customer_id"], name: "index_customers_on_company_customer_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "evidential_1"
    t.string "evidential_2"
    t.string "evidential_3"
    t.integer "item_type"
    t.integer "item_status"
    t.integer "price_hours_cents", default: 0, null: false
    t.string "price_hours_currency", default: "PLN", null: false
    t.integer "price_minute_cents", default: 0, null: false
    t.string "price_minute_currency", default: "PLN", null: false
    t.integer "price_day_cents", default: 0, null: false
    t.string "price_day_currency", default: "PLN", null: false
    t.integer "deposit_cents", default: 0, null: false
    t.string "deposit_currency", default: "PLN", null: false
    t.integer "use_limit"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_items_on_company_id"
  end

  create_table "rents", force: :cascade do |t|
    t.datetime "when"
    t.datetime "when_return"
    t.datetime "declare_return"
    t.integer "rent_status"
    t.integer "rent_type"
    t.integer "price_hours_cents", default: 0, null: false
    t.string "price_hours_currency", default: "PLN", null: false
    t.integer "price_minute_cents", default: 0, null: false
    t.string "price_minute_currency", default: "PLN", null: false
    t.integer "price_day_cents", default: 0, null: false
    t.string "price_day_currency", default: "PLN", null: false
    t.integer "deposit_cents", default: 0, null: false
    t.string "deposit_currency", default: "PLN", null: false
    t.integer "sumary_cost_cents", default: 0, null: false
    t.string "sumary_cost_currency", default: "PLN", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.bigint "customers_id", null: false
    t.index ["company_id"], name: "index_rents_on_company_id"
    t.index ["customers_id"], name: "index_rents_on_customers_id"
    t.index ["item_id"], name: "index_rents_on_item_id"
    t.index ["user_id"], name: "index_rents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "country"
    t.string "voivodeship"
    t.string "city"
    t.string "post_code"
    t.string "phone"
    t.string "company"
    t.string "nip"
    t.integer "role"
    t.string "personal_number"
    t.string "passwd"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "companies", "company_customers"
  add_foreign_key "company_customers", "companies"
  add_foreign_key "company_customers", "customers"
  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "customers", "company_customers"
  add_foreign_key "items", "companies"
  add_foreign_key "rents", "companies"
  add_foreign_key "rents", "customers", column: "customers_id"
  add_foreign_key "rents", "items"
  add_foreign_key "rents", "users"
end
