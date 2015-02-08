class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :login_check, except: [:index, :show]


  # GET /diaries
  # GET /diaries.json
  def index
    @diaries = Diary.page(params[:page]).per(5).order("authored_on desc")
    @year_list = Diary.year_list
    @monthly_list = Diary.monthly_list
  end

  def admin_index
    @diaries = Diary.page(params[:page]).per(30).order("authored_on desc")
  end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
    @prev = Diary.where("authored_on < ?", @diary.authored_on).order("authored_on desc").limit(1).first
    @next = Diary.where("? < authored_on", @diary.authored_on).order("authored_on desc").limit(1).first
    @year_list = Diary.year_list
    @monthly_list = Diary.monthly_list
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries
  # POST /diaries.json
  def create
    @diary = Diary.new(diary_params)

    respond_to do |format|
      if @diary.save
        format.html { redirect_to @diary, notice: 'Diary was successfully created.' }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to @diary, notice: 'Diary was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  def destroy
    @diary.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_diaries_url, notice: 'Diary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_diary
    @diary = Diary.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def diary_params
    params.require(:diary).permit(:authored_on, :category_id, :title, :body, :wheather_id, :mt_id)
  end

  def login_check
    if (session[:user_id] == nil)
      redirect_to root_path
    end
  end
end
