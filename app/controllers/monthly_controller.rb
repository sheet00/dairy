class MonthlyController < ApplicationController

  # GET /monthly:year:month
  def index
    @diaries = Diary.year_month(params[:year],params[:month]).page(params[:page]).per(5).order("authored_on desc")
    @year_list = Diary.year_list
    @monthly_list = Diary.monthly_list

    render template: "diaries/index"
  end


end
