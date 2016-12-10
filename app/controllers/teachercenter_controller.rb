class TeachercenterController < ApplicationController
    before_action :check_login
    before_action :set_teacher
    before_action :set_current
  def index
  end

  def courses
      @courses = @teacher.courses
  end

  def course
      @course = courses.find(params[:course_id])
  end

  def comments
      @comments = @teacher.comments
  end

  def messages

  end

  def revise
    respond_to do |format|
      if @teacher.update(revise_params)
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
    @course.stage = 'ongoing'
    respond_to do |format|
        if @course.save
          @teacher.courses << @course
          format.html { redirect_to ucenter_course_path(@course), notice: 'Course was successfully created.' }
          format.json { render :show, status: :created, location: @course }
        else
          format.html { render :new, notice: '创建失败！' }
        end
    end
  end

  def dispose_course
    @course = Course.find(params[:course_id])
    if @teacher.courses.include?(@course)
        if params[:command] == 'accept' && @course.stage == 'waiting'
            @course.update(stage: 'ongoing')
        elsif params[:command] == 'refuse' && @course.stage == 'waiting'
            @course.update(stage: 'refused')
        elsif params[:command] == 'finish' && @course.stage == 'ongoing'
            @course.update(stage: 'finished')
        end
        redirect_to teacenter_course_path(@course), notice: '操作成功！' and return
    end
    redirect_to teacenter_course_path(@course), notice: '操作无效！'
  end

  private

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
