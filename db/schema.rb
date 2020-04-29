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

ActiveRecord::Schema.define(version: 2020_04_29_180253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reddit_accounts", force: :cascade do |t|
    t.boolean "is_employee"
    t.string "icon_img"
    t.string "name"
    t.datetime "reddit_created_at"
    t.integer "link_karma"
    t.integer "comment_karma"
    t.boolean "is_gold"
    t.boolean "is_mod"
    t.datetime "created_utc"
    t.boolean "verified"
    t.boolean "has_verified_email"
    t.string "reddit_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "reddit_created_at_utc"
    t.index ["name"], name: "index_reddit_accounts_on_name"
  end

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
    t.string "link_id"
    t.integer "likes"
    t.integer "depth"
    t.string "approved_by"
    t.boolean "locked"
    t.boolean "stickied"
    t.boolean "archived"
    t.integer "total_awards_received"
    t.datetime "reddit_created_at"
    t.datetime "reddit_created_at_utc"
    t.datetime "approved_at_utc"
    t.datetime "banned_at_utc"
    t.integer "ups"
    t.index ["parent_id"], name: "index_reddit_comments_on_parent_id"
    t.index ["reddit_id"], name: "index_reddit_comments_on_reddit_id", unique: true
    t.index ["subreddit_id"], name: "index_reddit_comments_on_subreddit_id"
  end

  create_table "reddit_links", force: :cascade do |t|
    t.datetime "approved_at_utc"
    t.boolean "saved"
    t.integer "gilded"
    t.boolean "clicked"
    t.text "title"
    t.boolean "hidden"
    t.integer "pwls"
    t.integer "downs"
    t.boolean "hide_score"
    t.text "name"
    t.boolean "quarantine"
    t.decimal "upvote_ratio"
    t.integer "ups"
    t.integer "total_awards_received"
    t.text "author_fullname"
    t.boolean "is_meta"
    t.integer "num_duplicates"
    t.text "approved_by"
    t.boolean "author_premium"
    t.text "thumbnail"
    t.boolean "edited"
    t.datetime "reddit_created_at"
    t.datetime "reddit_created_at_utc"
    t.integer "wls"
    t.text "removed_by_category"
    t.text "banned_by"
    t.datetime "banned_at_utc"
    t.integer "view_count"
    t.boolean "archived"
    t.integer "score"
    t.boolean "no_follow"
    t.boolean "pinned"
    t.boolean "over_18"
    t.text "subreddit_id"
    t.text "reddit_id"
    t.integer "num_comments"
    t.boolean "stickied"
    t.text "url"
    t.integer "num_crossposts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_video"
    t.index ["author_fullname"], name: "index_reddit_links_on_author_fullname"
    t.index ["name"], name: "index_reddit_links_on_name"
    t.index ["reddit_id"], name: "index_reddit_links_on_reddit_id"
    t.index ["subreddit_id"], name: "index_reddit_links_on_subreddit_id"
  end

  create_table "reddit_subreddits", force: :cascade do |t|
    t.boolean "restrict_posting"
    t.text "display_name"
    t.text "header_img"
    t.text "title"
    t.integer "active_user_count"
    t.text "icon_img"
    t.integer "accounts_active"
    t.boolean "public_traffic"
    t.integer "subscribers"
    t.text "name"
    t.boolean "quarantine"
    t.text "public_description"
    t.text "header_title"
    t.datetime "reddit_created_at"
    t.integer "wls"
    t.text "subreddit_type"
    t.text "banner_img"
    t.text "reddit_id"
    t.boolean "over_18"
    t.text "description"
    t.text "lang"
    t.datetime "reddit_created_at_utc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["display_name"], name: "index_reddit_subreddits_on_display_name"
  end

  create_table "reddit_user_watch_lists", force: :cascade do |t|
    t.text "reddit_username"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reddit_username"], name: "index_reddit_user_watch_lists_on_reddit_username", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
