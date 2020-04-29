class SyncRedditSubredditAboutWorker
  include Sidekiq::Worker

  def perform(subreddit_name)
    reddit_url = RedditUrlGenerator.instance.subreddit_about(subreddit_name)
    JobPlannerService.call(reddit_url, ProcessRedditResponseWorker, {
      fetch_after: false,
      fetch_more: false
    })
  end
end
