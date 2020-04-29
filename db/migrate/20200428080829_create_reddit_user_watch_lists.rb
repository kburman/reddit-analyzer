class CreateRedditUserWatchLists < ActiveRecord::Migration[6.0]
  def change
    create_table :reddit_user_watch_lists do |t|
      t.text :reddit_username
      t.boolean :active

      t.timestamps
    end
  end
end
