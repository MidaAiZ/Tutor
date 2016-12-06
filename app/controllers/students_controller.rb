class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :destroy, :course, :courses, :appoint]
  before_action :check_login, only: [:course, :courses, :appoint]
 layout 'details'

  # GET /students/1
  # GET /students/1.json
  def show
      @student = Student.find(params[:id])
  end

  def appoint
     @course = Course.create(teacher_id: params[:id])
     byebug
     @student.courses << @course
     redirect_to teacher_path(params[:id])
  end

  def courses
      @courses = @student.courses
  end

  def course
      @course = @student.courses(params[:course_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = @account.student
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :num, :sex, :address, :school, :grade, :class, :intro)
    end
end
