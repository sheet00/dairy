class RssController < ApplicationController
  # GET /index
  def index
    @diaries = Diary.limit(10).order(authored_on: :desc)

    respond_to do |format|
      format.xml
      format.html
      format.json {render :json => @diaries}
    end
  end
end
