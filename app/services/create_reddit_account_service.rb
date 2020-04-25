class CreateRedditAccountService < ApplicationService
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    puts("Reddit Account #{data['name']}")
    account = RedditAccount.find_or_initialize_by(reddit_id: data['id'])
    account.is_employee = data['is_employee']
    account.name = data['name']
    account.icon_img = data['https://www.redditstatic.com/avatars/avatar_default_10_0DD3BB.png']
    account.reddit_created_at = Time.at(data['created'])
    account.reddit_created_at_utc = Time.at(data['created'], in: '+00:00')
    account.has_verified_email = data['has_verified_email']
    account.verified = data['verified']
    account.is_mod = data['is_mod']
    account.is_gold = data['is_gold']
    account.comment_karma = data['comment_karma']
    account.link_karma = data['link_karma']
    account.is_gold = data['is_gold']
    account.save!

    create_subreddit
  end

  private

  def create_subreddit
    data['subreddit']
  end
end
