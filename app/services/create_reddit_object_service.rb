class CreateRedditObjectService < ApplicationService
  attr_reader :data
  KIND_MAPPING = {
    't1' => CreateRedditCommentService,
    't2' => CreateRedditAccountService,
    't3' => CreateRedditLinkService,
    't5' => CreateRedditSubredditService,
  }.freeze

  def initialize(data)
    @data = data
  end

  def call
    process(data)
  end

  private

  def process(data)
    return if data.blank?

    if data.is_a?(Hash) && data.key?('kind')
      handle_reddit_obj(data)
    elsif data.is_a?(Array)
      data.each { |val| process(val) }
    else
      raise data
    end
  end

  def handle_reddit_obj(data)
    if KIND_MAPPING.key?(data['kind'])
      KIND_MAPPING[data['kind']].call(data['data'], @opts)
    elsif data['kind'] == 'Listing'
      process(data.dig('data', 'children'))
    elsif data['kind'] == 'more'
      nil
    else
      raise data['kind']
    end
  end
end
