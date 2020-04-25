class CreateRedditAccountService < ApplicationService
  def initialize(data)
    @data = data
  end

  def call
    puts("Reddit Account #{@data['name']}")
  end
end
