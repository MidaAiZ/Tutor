class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :entry]
  before_action :check_login, only: [:new, :create, :entry, :update]
  # layout 'collection'
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    @teacher = Teacher.find(params[:teacher])
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @teacher = Teacher.find(params[:course][:teacher_id])
    if @teacher == @account.teacher
       redirect_to  appoint_path(@teacher.id), notice: '预约失败！无法预约自己' and return
    end
    respond_to do |format|
      if @course.save && @teacher
        @account.student.courses << @course
        @teacher.courses << @course
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, notice: '预约失败' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def entry
    if @account.teacher == @course.teacher
        redirect_to course_path(@course), notice: '不能报名自己开设的课程' and return
    end
    @student = @account.student;
    @student.courses << @course
    redirect_to student_courses_path(@student)
  end
  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :tutor, :category, :begintime, :endtime, :price, :place, :teacher_id)
    end
end
