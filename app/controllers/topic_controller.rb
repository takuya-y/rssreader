class TopicController < ApplicationController
  before_action :auth, only: :index
  def index
    Rssreader.new
    # binding.pry
    @topics = Topic.all
  end

  private

  def auth
    name = 'test1'
    passwd = '8cb2237d0679ca88db6464eac60da96345513964'
    authenticate_or_request_with_http_basic() do |n, p|
      n == name && Digest::SHA1.hexdigest(p) == passwd
    end
  end
end
