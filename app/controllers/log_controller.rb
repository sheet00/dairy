class LogController < ApplicationController
  before_action :set_log

  def production
    render :index
  end

  def access
    render :index
  end

  def error
    render :index
  end


  private
  def set_log
    target = action_name
    path = Settings.log_path[target]

    @log = []
    open(path) {|file|
      while row = file.gets
        @log << row
      end
    }

  end

end
