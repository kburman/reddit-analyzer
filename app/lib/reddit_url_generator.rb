# frozen_string_literal: true

class RedditUrlGenerator
  include Singleton
  BASE_URL = 'https://www.reddit.com'

  def post_link(subreddit_name, post_id)
    link = URI.parse(BASE_URL)
    link.path = "/r/#{subreddit_name}/comments/#{post_id}"
    link.query = URI.encode_www_form(default_query_params)

    link.to_s
  end

  def user_comments(username)
    link = URI.parse(BASE_URL)
    link.path = "/user/#{username}/comments/"
    link.query = URI.encode_www_form(default_query_params)

    link.to_s
  end

  def user_overview(username)
    link = URI.parse(BASE_URL)
    link.path = "/user/#{username}/overview/"
    link.query = URI.encode_www_form(default_query_params)

    link.to_s
  end

  def user_about(username)
    link = URI.parse(BASE_URL)
    link.path = "/user/#{username}/about/"
    link.query = URI.encode_www_form(default_query_params)

    link.to_s
  end

  def make_json_api(url)
    link = URI.parse(url)
    return url if link.path.end_with?('.json')

    path_arr = link.path.split('/')
    path_arr << '.json'
    link.path = path_arr.join('/')

    link
  end

  private

  def default_query_params
    { limit: 100 }
  end
end
