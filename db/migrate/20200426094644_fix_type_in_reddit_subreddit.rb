class FixTypeInRedditSubreddit < ActiveRecord::Migration[6.0]
  def change
    rename_column :reddit_subreddits, :reddit_create_at, :reddit_created_at
  end
end
