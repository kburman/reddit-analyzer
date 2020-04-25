class CreateRedditSubredditService < ApplicationService
  attr_reader :data, :opts

  def initialize(data, opts)
    @data = data
    @opts = opts
  end

  def call
    puts("Reddit Subreddit #{@data['name']}")
    @record = RedditSubreddit.find_or_initialize_by(reddit_id: data['id'])

    @record.reddit_created_at = Time.at(data['created'], in: '+00:00')
    @record.reddit_created_at_utc = Time.at(data['created_utc'], in: '+00:00')

    @record.display_name = data['display_name']
    @record.header_img = data['header_img']
    @record.title = data['title']
    @record.active_user_count = data['active_user_count']
    @record.icon_img = data['icon_img']
    @record.accounts_active = data['accounts_active']
    @record.public_traffic = data['public_traffic']
    @record.subscribers = data['subscribers']
    @record.name = data['name']
    @record.quarantine = data['quarantine']
    @record.public_description = data['public_description']
    @record.header_title = data['header_title']
    @record.wls = data['wls']
    @record.subreddit_type = data['subreddit_type']
    @record.over_18 = data['over18']
    @record.description = data['description']
    @record.save!
  end
end
