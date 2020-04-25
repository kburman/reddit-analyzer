class AddRedditCreatedAtUtcToRedditAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :reddit_accounts, :reddit_created_at_utc, :datetime
  end
end
