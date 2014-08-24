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

ActiveRecord::Schema.define(version: 20140824183001) do

  create_table "cart_items", force: true do |t|
    t.integer  "quantity",   null: false
    t.integer  "product_id", null: false
    t.integer  "cart_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id"
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id"

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name",           null: false
    t.text     "description",    null: false
    t.integer  "price_in_cents", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.integer  "category_id"
    t.integer  "sale"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "reviews", force: true do |t|
    t.text     "comment",    null: false
    t.integer  "product_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating",     null: false
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id"

end
