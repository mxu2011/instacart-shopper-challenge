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

ActiveRecord::Schema.define(version: 20170202213349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_steps", force: :cascade do |t|
    t.integer  "funnel_id",            null: false
    t.integer  "shopper_applicant_id", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["funnel_id", "shopper_applicant_id"], name: "index_application_steps_on_funnel_id_and_shopper_applicant_id", unique: true, using: :btree
  end

  create_table "funnels", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_funnels_on_name", unique: true, using: :btree
  end

  create_table "shopper_applicants", force: :cascade do |t|
    t.string   "first_name",                   null: false
    t.string   "last_name",                    null: false
    t.string   "email",                        null: false
    t.string   "phone_number",                 null: false
    t.string   "zip_code",                     null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "background_check_accepted_at"
    t.index "date_trunc('week'::text, created_at)", name: "index_shopper_applicants_on_created_at_by_week", using: :btree
    t.index ["created_at"], name: "index_shopper_applicants_on_created_at", using: :btree
  end

end
