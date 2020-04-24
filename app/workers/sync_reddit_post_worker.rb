class SyncRedditPostWorker
  include Sidekiq::Worker

  def perform(subreddit_name, post_id)
    reddit_url = RedditUrlGenerator.instance.post_link(subreddit_name, post_id)
    JobPlannerService.call(reddit_url, ProcessRedditResponseWorker, {
      fetch_after: true,
      fetch_more: true
    })
  end
end
