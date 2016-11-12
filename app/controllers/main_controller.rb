class MainController < ApplicationController
  def index
      @students = Student.order(created_at: :desc).limit(10)
      @teachers = Teacher.order(created_at: :desc).limit(10)
  end
end
