class RedditUserWatchList < ApplicationRecord
  validates_uniqueness_of :reddit_username
end

# == Schema Information
# Schema version: 20200428080829
#
# Table name: reddit_user_watch_lists
#
#  id              :bigint           not null, primary key
#  reddit_username :text
#  active          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
