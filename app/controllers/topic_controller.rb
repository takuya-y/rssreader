class TopicController < ApplicationController
  def index
    Topic.delete_all
    run = Rssreader.new
    run.rssrun
    # binding.pry
    @topics = Topic.all
  end
end
