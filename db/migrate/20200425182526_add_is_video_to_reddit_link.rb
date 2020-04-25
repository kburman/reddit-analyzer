class AddIsVideoToRedditLink < ActiveRecord::Migration[6.0]
  def change
    add_column :reddit_links, :is_video, :boolean

  end
end
