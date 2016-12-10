class UsercenterController < ApplicationController
  before_action :set_current, :check_login

  def index
  end

  def courses
      @courses = @account.student.courses
  end

  def course
      @course = courses.find(params[:course_id])
      @comment = Comment.find_by(student_id: @account.student, course_id: @course) || Comment.new
  end

  def comments
      set_student
      @comments = @student.comments 
  end

  def messages

  end

  def more
  end

  def revise
    respond_to do |format|
      if @account.student.update(revise_params)
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
    #
    params.require(:revise).permit()
  end
  def revise_params
      {params[:revise].keys.first => params[:revise].values.first}
  end
end
