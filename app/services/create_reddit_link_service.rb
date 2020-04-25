class CreateRedditLinkService < ApplicationService
  def initialize(data)
    @data = data
  end

  def call
    puts("Reddit Link #{@data['name']}")

  end
end
