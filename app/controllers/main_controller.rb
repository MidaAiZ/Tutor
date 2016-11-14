class MainController < ApplicationController
  def index
      @students = Student.order(created_at: :desc).limit(10)
      @teachers = Teacher.order(created_at: :desc).limit(8)
  end
  def login
      @account = Account.find_by(params[:id])
      if !@account.nil?
          session[:user_id] = @account.id;
      else
          redirect_to login
      end
  end
  def logout
      session[:user_id] = nil
  end
  def register
  end
end
