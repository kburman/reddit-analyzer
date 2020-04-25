class CreateRedditCommentService < ApplicationService
  def initialize(data)
    @data = data
  end

  def call
    puts("Reddit Comment #{@data['name']}")

  end
end
