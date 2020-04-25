class RedditLink < ApplicationRecord
end

# == Schema Information
# Schema version: 20200425183523
#
# Table name: reddit_links
#
#  id                    :bigint           not null, primary key
#  approved_at_utc       :datetime
#  saved                 :boolean
#  gilded                :integer
#  clicked               :boolean
#  title                 :text
#  hidden                :boolean
#  pwls                  :integer
#  downs                 :integer
#  hide_score            :boolean
#  name                  :text
#  quarantine            :boolean
#  upvote_ratio          :decimal(, )
#  ups                   :integer
#  total_awards_received :integer
#  author_fullname       :text
#  is_meta               :boolean
#  num_duplicates        :integer
#  approved_by           :text
#  author_premium        :boolean
#  thumbnail             :text
#  edited                :boolean
#  reddit_created_at     :datetime
#  reddit_created_at_utc :datetime
#  wls                   :integer
#  removed_by_category   :text
#  banned_by             :text
#  banned_at_utc         :datetime
#  view_count            :integer
#  archived              :boolean
#  score                 :integer
#  no_follow             :boolean
#  pinned                :boolean
#  over_18               :boolean
#  subreddit_id          :text
#  reddit_id             :text
#  num_comments          :integer
#  stickied              :boolean
#  url                   :text
#  num_crossposts        :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  is_video              :boolean
#
# Indexes
#
#  index_reddit_links_on_author_fullname  (author_fullname)
#  index_reddit_links_on_name             (name)
#  index_reddit_links_on_reddit_id        (reddit_id)
#  index_reddit_links_on_subreddit_id     (subreddit_id)
#
