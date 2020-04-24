# frozen_string_literal: true

class RedditApiFetchService < ApplicationService
  FF_UA = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36 OPR/38.0.2220.41'

  def initialize(url, options)
    @url = URI.parse(url)
    @options = options
    @next_urls = {}
    add_json_to_url
  end

  def call
    api_response = HTTParty.get(@url, headers: http_headers)
    raise 'HTTP Request Failed' unless api_response.ok?

    traverse_data(api_response.parsed_response)

    {
      data: api_response.parsed_response,
      next_links: @next_urls
    }
  end

  private

  def http_headers
    {
      'User-Agent' => FF_UA
    }
  end

  def process_error_code(response_code)
    raise 'HTTP Request Failed' if response_code != 200
  end

  def add_json_to_url
    return if @url.path.end_with?('.json')

    path = @url.path.split('/')
    path << '.json'
    @url.path = path.join('/')
  end

  def traverse_data(data)
    return if data.blank?

    if data.is_a?(Array)
      handle_array(data)
    elsif data.is_a?(Hash)
      handle_hash(data)
    end
  end

  def handle_array(data)
    data.each { |val| traverse_data(val) }
  end

  def handle_hash(data)
    if data['kind'] == 'Listing'
      handle_listing(data)
    elsif data['kind'] == 'more'
      handle_more(data)
    else
      data.values.each { |val| traverse_data(val) }
    end
  end

  def handle_listing(data)
    after_tag = data.dig('data', 'after')
    if after_tag.present? && fetch_after?
      next_url = URI.parse(@url.to_s)
      query_params = URI.decode_www_form(next_url.query || '').to_h
      query_params[:after] = after_tag
      next_url.query = URI.encode_www_form(query_params)
      @next_urls[:after_tag] = next_url
    end

    traverse_data(data['data'])
  end

  def handle_more(data)
    children = data.dig('data', 'children')
    return if children.nil? || !fetch_more?
    raise 'more kind children is not in array format' unless children.is_a?(Array)

    children.each do |child|
      plain_url = URI.parse(@url.to_s)
      plain_url.path.gsub!('/.json', "/#{child}/.json")
      @next_urls["more_#{child}"] = plain_url
    end
  end

  def fetch_after?
    @options['fetch_after']
  end

  def fetch_more?
    @options['fetch_more']
  end
end
