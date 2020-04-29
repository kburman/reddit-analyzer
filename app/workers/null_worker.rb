class NullWorker
  include Sidekiq::Worker
  sidekiq_options queue: :critical

  def perform; end
end
