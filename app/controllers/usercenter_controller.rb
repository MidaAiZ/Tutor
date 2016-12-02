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
      if @account.update(account_params)
        format.json { render json: @account}
      else
        format.json { render json: @account }
      end
    end
  end

  private

  def set_current
       @current = params[:action]
  end
  def account_params
    params.permit(:realname)
  end

end
