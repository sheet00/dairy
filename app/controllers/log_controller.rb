class LogController < ApplicationController
  before_action :set_log

  def production
    common_render
  end

  def access
    common_render
  end

  def error
    common_render
  end


  private
  def set_log
    path = Settings.log_path[action_name]

    if path.nil? then return end

    @log = []
    File.open(path) {|file|
      while row = file.gets
        @log << row
      end
    }

    @log_txt = File.open(path).read
  end

  def common_render
    respond_to do |format|
      format.html {render :index}
      format.txt  {render :text => @log_txt}
    end
  end

end
