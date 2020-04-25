class CreateRedditSubreddits < ActiveRecord::Migration[6.0]
  def change
    create_table :reddit_subreddits do |t|
      t.boolean :restrict_posting
      t.text :display_name
      t.text :header_img
      t.text :title
      t.integer :active_user_count
      t.text :icon_img
      t.integer :accounts_active
      t.boolean :public_traffic
      t.integer :subscribers
      t.text :name
      t.boolean :quarantine
      t.text :public_description
      t.text :header_title
      t.datetime :reddit_create_at
      t.integer :wls
      t.text :subreddit_type
      t.text :banner_img
      t.text :reddit_id
      t.boolean :over_18
      t.text :description
      t.text :lang
      t.datetime :reddit_created_at_utc

      t.timestamps
    end
    add_index :reddit_subreddits, :display_name
  end
end
