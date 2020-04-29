# frozen_string_literal: true

class CreateRedditCommentService < ApplicationService
  attr_reader :data, :opts

  def initialize(data, opts)
    @data = data
    @opts = opts
  end

  def call
    puts("Reddit Comment #{@data['name']}")
    load_record
    @record.total_awards_received = data['total_awards_received']

    unless data['approved_at_utc'].blank?
      @record.approved_at_utc = Time.at(data['approved_at_utc'], in: '+00:00')
    end

    unless data['banned_at_utc'].blank?
      @record.banned_at_utc = Time.at(data['banned_at_utc'], in: '+00:00')
    end

    @record.reddit_created_at = Time.at(data['created'], in: '+00:00')
    @record.reddit_created_at_utc = Time.at(data['created_utc'], in: '+00:00')

    @record.ups = data['ups']
    @record.link_id = data['link_id']
    @record.likes = data['likes']
    @record.archived = data['archived']
    @record.author = data['author']
    @record.parent_id = data['parent_id']
    @record.score = data['score']
    @record.approved_by = data['approved_by']
    @record.subreddit_id = data['subreddit_id']
    @record.body = data['body']
    @record.edited = data['edited']
    @record.downs = data['downs']
    @record.stickied = data['stickied']
    @record.author_premium = data['author_premium']
    @record.locked = data['locked']
    @record.controversiality = data['controversiality']
    @record.depth = data['depth']
    @record.save!

    CreateRedditObjectService.call(@data['replies'])
    scrape_subreddit
    # scrape_parent_post
  end

  private

  def load_record
    @record = RedditComment.find_or_initialize_by(reddit_id: data['id'])
  end

  def scrape_subreddit
    redis_key = data['subreddit']
    RedditKeyCacheService.call(redis_key) do
      SyncRedditSubredditAboutWorker.perform_async(redis_key)
    end
  end

  def scrape_parent_post
    redis_key = "#{data['subreddit']}-#{data['link_id']}"

    RedditKeyCacheService.call(redis_key) do
      SyncRedditPostWorker.perform_async(
        data['subreddit'], data['link_id'].split('_').last
      )
    end
  end
end
