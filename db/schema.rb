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

ActiveRecord::Schema.define(version: 2020_04_24_073444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reddit_comments", force: :cascade do |t|
    t.string "reddit_id"
    t.string "author"
    t.string "parent_id"
    t.integer "score"
    t.string "author_fullname"
    t.string "subreddit_id"
    t.text "body"
    t.boolean "edited"
    t.integer "downs"
    t.boolean "author_premium"
    t.string "name"
    t.integer "num_reports"
    t.integer "created"
    t.integer "created_utc"
    t.integer "controversiality"
    t.jsonb "raw_json"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_reddit_comments_on_parent_id"
    t.index ["reddit_id"], name: "index_reddit_comments_on_reddit_id", unique: true
    t.index ["subreddit_id"], name: "index_reddit_comments_on_subreddit_id"
  end

end
