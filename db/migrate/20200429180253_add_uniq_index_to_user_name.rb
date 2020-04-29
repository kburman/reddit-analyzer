class AddUniqIndexToUserName < ActiveRecord::Migration[6.0]
  def change
    add_index :reddit_user_watch_lists, :reddit_username, unique: true
  end
end
