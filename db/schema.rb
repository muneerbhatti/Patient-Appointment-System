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

ActiveRecord::Schema[7.2].define(version: 2025_04_03_065123) do
  create_table "admins", force: :cascade do |t|
    t.string "Name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "Name"
    t.string "Email"
    t.string "ContactNo"
    t.string "Address"
    t.string "Specialization"
    t.string "experience_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.integer "medicine_type", default: 0
    t.integer "prescription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescription_id"], name: "index_medicines_on_prescription_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "Name"
    t.string "CNIC"
    t.string "PhoneNo"
    t.string "Gender"
    t.string "date_of_birth"
    t.string "Address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.integer "payment_type", default: 0
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "method"
    t.integer "token_id"
    t.integer "status", default: 0
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "formula"
    t.integer "token_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token_id"], name: "index_prescriptions_on_token_id"
  end

  create_table "receptions", force: :cascade do |t|
    t.string "Name"
    t.string "phoneno"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "Blood_pressure"
    t.string "Temperature"
    t.string "Weight"
    t.integer "doctor_id", null: false
    t.integer "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["doctor_id"], name: "index_tokens_on_doctor_id"
    t.index ["patient_id"], name: "index_tokens_on_patient_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "userable_type"
    t.integer "userable_id"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["userable_type", "userable_id"], name: "index_users_on_userable"
  end

  add_foreign_key "medicines", "prescriptions"
  add_foreign_key "prescriptions", "tokens"
  add_foreign_key "tokens", "doctors"
  add_foreign_key "tokens", "patients"
end
