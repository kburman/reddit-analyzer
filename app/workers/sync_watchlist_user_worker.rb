class SyncWatchlistUserWorker
  include Sidekiq::Worker

  def perform
    RedditUserWatchList.where(active: true).find_each do |user|
      SyncRedditUserWorker.perform_async(user.reddit_username)
    end
  end
end
