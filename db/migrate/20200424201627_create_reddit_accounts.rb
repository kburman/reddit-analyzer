class CreateRedditAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :reddit_accounts do |t|
      t.boolean :is_employee
      t.string :icon_img
      t.string :name
      t.datetime :reddit_created_at
      t.integer :link_karma
      t.integer :comment_karma
      t.boolean :is_gold
      t.boolean :is_mod
      t.datetime :created_utc
      t.boolean :verified
      t.boolean :has_verified_email
      t.string :reddit_id

      t.timestamps
    end
    add_index :reddit_accounts, :name
  end
end
