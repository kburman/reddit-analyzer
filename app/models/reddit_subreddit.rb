class RedditSubreddit < ApplicationRecord
end

# == Schema Information
# Schema version: 20200428080829
#
# Table name: reddit_subreddits
#
#  id                    :bigint           not null, primary key
#  restrict_posting      :boolean
#  display_name          :text
#  header_img            :text
#  title                 :text
#  active_user_count     :integer
#  icon_img              :text
#  accounts_active       :integer
#  public_traffic        :boolean
#  subscribers           :integer
#  name                  :text
#  quarantine            :boolean
#  public_description    :text
#  header_title          :text
#  reddit_created_at     :datetime
#  wls                   :integer
#  subreddit_type        :text
#  banner_img            :text
#  reddit_id             :text
#  over_18               :boolean
#  description           :text
#  lang                  :text
#  reddit_created_at_utc :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_reddit_subreddits_on_display_name  (display_name)
#
