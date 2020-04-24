class RedditComment < ApplicationRecord
  has_paper_trail
end

# == Schema Information
# Schema version: 20200424075155
#
# Table name: reddit_comments
#
#  id               :bigint           not null, primary key
#  reddit_id        :string
#  author           :string
#  parent_id        :string
#  score            :integer
#  author_fullname  :string
#  subreddit_id     :string
#  body             :text
#  edited           :boolean
#  downs            :integer
#  author_premium   :boolean
#  name             :string
#  num_reports      :integer
#  created          :integer
#  created_utc      :integer
#  controversiality :integer
#  raw_json         :jsonb
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_reddit_comments_on_parent_id     (parent_id)
#  index_reddit_comments_on_reddit_id     (reddit_id) UNIQUE
#  index_reddit_comments_on_subreddit_id  (subreddit_id)
#
