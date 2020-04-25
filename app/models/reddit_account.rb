class RedditAccount < ApplicationRecord
  has_paper_trail
end

# == Schema Information
# Schema version: 20200425174227
#
# Table name: reddit_accounts
#
#  id                    :bigint           not null, primary key
#  is_employee           :boolean
#  icon_img              :string
#  name                  :string
#  reddit_created_at     :datetime
#  link_karma            :integer
#  comment_karma         :integer
#  is_gold               :boolean
#  is_mod                :boolean
#  created_utc           :datetime
#  verified              :boolean
#  has_verified_email    :boolean
#  reddit_id             :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  reddit_created_at_utc :datetime
#
# Indexes
#
#  index_reddit_accounts_on_name  (name)
#
