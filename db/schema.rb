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

ActiveRecord::Schema.define(version: 20170715055838) do

  create_table "contributions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "repository_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repository_id"], name: "index_contributions_on_repository_id"
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "type"
    t.integer "repository_id"
    t.integer "user_id"
    t.integer "organization_id"
    t.integer "gh_id"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["repository_id"], name: "index_events_on_repository_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "url"
    t.string "public_members"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "owner_type"
    t.integer "owner_id"
    t.string "language"
    t.integer "stars"
    t.integer "forks"
    t.index ["owner_type", "owner_id"], name: "index_repositories_on_owner_type_and_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
