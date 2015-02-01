class DiaryCountsController < ApplicationController
  before_action :set_diary_count, only: [:show, :edit, :update, :destroy]

  # GET /diary_counts
  # GET /diary_counts.json
  def index
    @diary_counts = DiaryCount.all
  end

  # GET /diary_counts/1
  # GET /diary_counts/1.json
  def show
  end

  # GET /diary_counts/new
  def new
    @diary_count = DiaryCount.new
  end

  # GET /diary_counts/1/edit
  def edit
  end

  # POST /diary_counts
  # POST /diary_counts.json
  def create
    @diary_count = DiaryCount.new(diary_count_params)

    respond_to do |format|
      if @diary_count.save
        format.html { redirect_to @diary_count, notice: 'Diary count was successfully created.' }
        format.json { render :show, status: :created, location: @diary_count }
      else
        format.html { render :new }
        format.json { render json: @diary_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diary_counts/1
  # PATCH/PUT /diary_counts/1.json
  def update
    respond_to do |format|
      if @diary_count.update(diary_count_params)
        format.html { redirect_to @diary_count, notice: 'Diary count was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary_count }
      else
        format.html { render :edit }
        format.json { render json: @diary_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diary_counts/1
  # DELETE /diary_counts/1.json
  def destroy
    @diary_count.destroy
    respond_to do |format|
      format.html { redirect_to diary_counts_url, notice: 'Diary count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary_count
      @diary_count = DiaryCount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_count_params
      params.require(:diary_count).permit(:year, :month, :monthly_count)
    end
end
