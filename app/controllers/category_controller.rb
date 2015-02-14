class CategoryController < ApplicationController

  # GET /category/:id
  def index
  	@diaries = Diary.default(params[:page]).where(:category_id => params[:id])
  	render template: "diaries/index"
  end


end
