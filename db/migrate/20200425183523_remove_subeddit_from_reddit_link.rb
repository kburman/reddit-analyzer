class RemoveSubedditFromRedditLink < ActiveRecord::Migration[6.0]
  def change
    remove_column :reddit_links, :subreddit
  end
end
