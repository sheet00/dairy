class MonthlyController < ApplicationController

  # GET /monthly:year:month
  def index
    @diaries = Diary.default(params[:page]).year_month(params[:year],params[:month])
    render template: "diaries/index"
  end


end
