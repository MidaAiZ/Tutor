class TeachercenterController < ApplicationController
    before_action :check_login
    before_action :set_teacher
    before_action :set_current
  def index
  end

  def courses
  end

  def comments

  end

  def courses
      @courses = @account.teacher.courses
  end

  def students
      @students = @teacher.students
  end

  def revise
    respond_to do |format|
      if @account.teacher.update(params[:revise].keys.first => params[:revise].values.first)
        format.json { render :revise }
      else
        format.json { render :revise }
      end
    end
  end

  private

  def set_teacher
       @teacher = @account.teacher
  end
  def set_current
      @current = params[:action]
  end
end
