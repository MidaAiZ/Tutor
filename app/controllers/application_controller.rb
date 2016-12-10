class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_account

  def set_student
      @student = @account.student
  end

  def set_teacher
      @teacher = @account.teacher
  end

  def check_login
     if session[:user_id]
         session[:user_id]
     else
         redirect_to login_path
     end
  end

  def get_account
      if session[:user_id]
        @account = Account.find(session[:user_id])
      else
        @account = Account.new
      end
  end
end
