class AddMissingFieldInRedditComment < ActiveRecord::Migration[6.0]
  def change
    add_column :reddit_comments, :link_id, :string
    add_column :reddit_comments, :likes, :integer
    add_column :reddit_comments, :depth, :integer
    add_column :reddit_comments, :approved_by, :string
    add_column :reddit_comments, :locked, :boolean
    add_column :reddit_comments, :stickied, :boolean
    add_column :reddit_comments, :archived, :boolean
    add_column :reddit_comments, :total_awards_received, :integer
    add_column :reddit_comments, :reddit_created_at, :datetime
    add_column :reddit_comments, :reddit_created_at_utc, :datetime
    add_column :reddit_comments, :approved_at_utc, :datetime
    add_column :reddit_comments, :banned_at_utc, :datetime
    add_column :reddit_comments, :ups, :integer
  end
end
