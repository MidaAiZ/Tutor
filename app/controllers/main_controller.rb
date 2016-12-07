class MainController < ApplicationController
  def index
      @students = Student.order(created_at: :desc).limit(5)
      @teachers = Teacher.order(created_at: :desc).limit(8)
      @courses = Course.where(is_public: true).order(created_at: :desc).limit(4)
      if session[:user_id]
        @account = Account.find(session[:user_id])
      else
        @account = Account.new
      end
  end
  def login
  end
  def logout
      session[:user_id] = nil
  end
  def register
  end
end
