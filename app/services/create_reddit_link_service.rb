class CreateRedditLinkService < ApplicationService
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    puts("Reddit Link #{@data['name']}")
    link = RedditLink.find_or_initialize_by(reddit_id: data['id'])
    unless data['approved_at_utc'].blank?
      link.approved_at_utc = Time.at(data['approved_at_utc'], in: '+00:00')
    end
    link.reddit_created_at = Time.at(data['created'], in: '+00:00')
    link.reddit_created_at_utc = Time.at(data['created_utc'], in: '+00:00')
    link.saved = data['saved']
    link.gilded = data['gilded']
    link.clicked = data['clicked']
    link.title = data['title']
    link.hidden = data['hidden']
    link.pwls = data['pwls']
    link.downs = data['downs']
    link.hide_score = data['hide_score']
    link.name = data['name']
    link.quarantine = data['quarantine']
    link.upvote_ratio = data['upvote_ratio']
    link.total_awards_received = data['total_awards_received']
    link.author_fullname = data['author_fullname']
    link.is_meta = data['is_meta']
    link.num_duplicates = data['num_duplicates']
    link.author_premium = data['author_premium']
    link.thumbnail = data['thumbnail']
    link.edited = data['edited']
    link.wls = data['wls']
    link.view_count = data['view_count']
    link.archived = data['archived']
    link.score = data['score']
    link.pinned = data['pinned']
    link.over_18 = data['over_18']
    link.score = data['score']
    link.subreddit_id = data['subreddit_id']
    link.num_comments = data['num_comments']
    link.url = data['url']
    link.num_crossposts = data['num_crossposts']
    link.is_video = data['is_video']
    link.save!
  end
end
