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

    create_replies(@data['replies'])
  end

  private

  def load_record
    @record = RedditComment.find_or_initialize_by(reddit_id: data['id'])
  end

  def create_replies(data)
    return if data.blank?

    unless data['kind'] == 'Listing'
      raise "Not a valid replies data #{data['kind']}"
    end

    data['data']['children'].each { |c| self.class.call(c) }
  end
end
