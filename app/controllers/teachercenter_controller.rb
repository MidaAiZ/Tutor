class TeachercenterController < ApplicationController
    before_action :check_login
    before_action :set_teacher
    before_action :set_current
  def index
  end

  def course
      @course = courses.find(params[:course_id])
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
      if @account.teacher.update(revise_params)
        format.json { render :revise }
      else
        format.json { render :revise }
      end
    end
  end

  def course
    @course = Course.find(params[:course_id])
  end

  def new_course
    @course = Course.new
  end

  def create_course
    @course = Course.new(course_params)
    @course.is_public = true
    respond_to do |format|
        if @course.save
          @account.teacher.courses << @course
          format.html { redirect_to @course, notice: 'Course was successfully created.' }
          format.json { render :show, status: :created, location: @course }
        else
          format.html { render :new, notice: '创建失败！' }
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

  def course_params
    params.require(:course).permit(:name, :category, :begintime, :price, :place)
  end

  def revise_params
      {params[:revise].keys.first => params[:revise].values.first}
  end
end
