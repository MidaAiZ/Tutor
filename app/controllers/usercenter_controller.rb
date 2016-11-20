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

  private

  def set_current
       @current = params[:action]
  end

end
