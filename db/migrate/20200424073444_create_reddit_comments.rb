class CreateRedditComments < ActiveRecord::Migration[6.0]
  def change
    create_table :reddit_comments do |t|
      t.string :reddit_id
      t.string :author
      t.string :parent_id
      t.integer :score
      t.string :author_fullname
      t.string :subreddit_id
      t.text :body
      t.boolean :edited
      t.integer :downs
      t.boolean :author_premium
      t.string :name
      t.integer :num_reports
      t.integer :created
      t.integer :created_utc
      t.integer :controversiality
      t.jsonb :raw_json

      t.timestamps
    end
    add_index :reddit_comments, :reddit_id, unique: true
    add_index :reddit_comments, :parent_id
    add_index :reddit_comments, :subreddit_id
  end
end
