class CreateRedditLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :reddit_links do |t|
      t.datetime :approved_at_utc
      t.text :subreddit
      t.boolean :saved
      t.integer :gilded
      t.boolean :clicked
      t.text :title
      t.boolean :hidden
      t.integer :pwls
      t.integer :downs
      t.boolean :hide_score
      t.text :name
      t.boolean :quarantine
      t.decimal :upvote_ratio
      t.integer :ups
      t.integer :total_awards_received
      t.text :author_fullname
      t.boolean :is_meta
      t.integer :num_duplicates
      t.text :approved_by
      t.boolean :author_premium
      t.text :thumbnail
      t.boolean :edited
      t.datetime :reddit_created_at
      t.datetime :reddit_created_at_utc
      t.integer :wls
      t.text :removed_by_category
      t.text :banned_by
      t.datetime :banned_at_utc
      t.integer :view_count
      t.boolean :archived
      t.integer :score
      t.boolean :no_follow
      t.boolean :pinned
      t.boolean :over_18
      t.text :subreddit_id
      t.text :reddit_id
      t.integer :num_comments
      t.boolean :stickied
      t.text :url
      t.integer :num_crossposts

      t.timestamps
    end
    add_index :reddit_links, :subreddit
    add_index :reddit_links, :name
    add_index :reddit_links, :author_fullname
    add_index :reddit_links, :subreddit_id
    add_index :reddit_links, :reddit_id
  end
end
