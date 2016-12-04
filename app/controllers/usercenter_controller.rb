class UsercenterController < ApplicationController
  before_action :set_current
  layout 'usercenter'

  def index
  end

  def courses
      @courses = @account.student.courses
  end

  def messages

  end

  def more
  end

  def revise
    respond_to do |format|
      if @account.student.update(params[:revise].keys.first => params[:revise].values.first)
        format.json { render :revise }
      else
        format.json { render :revise }
      end
    end
  end

  private

  def set_current
       @current = params[:action]
  end
  def account_params
    #   params[:revise].keys.first => params[:revise].values.first
    params.require(:revise).permit()
  end

end
