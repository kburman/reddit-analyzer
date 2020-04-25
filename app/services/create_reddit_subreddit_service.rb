class CreateRedditSubredditService < ApplicationService
  def initialize(data)
    @data = data
  end

  def call
    puts("Reddit Subreddit #{@data['name']}")

  end
end
