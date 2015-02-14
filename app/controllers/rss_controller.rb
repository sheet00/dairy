class RssController < ApplicationController
  before_filter :request_filter

  # GET /rss
  def rss
    render :xml => RSS.create_rss
  end

  #url取得用
  def request_filter
    Thread.current[:request] = request
  end

end
