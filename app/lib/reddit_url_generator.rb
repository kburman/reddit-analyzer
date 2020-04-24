class RedditUrlGenerator
  include Singleton

  def post_link(subreddit_name, post_id)
    "https://www.reddit.com/r/#{subreddit_name}/comments/#{post_id}"
  end

  def user_comments(username)
    "https://www.reddit.com/user/#{username}/comments/"
  end
end
