class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    set_student
    set_course
    if  has_course? && uncomment?
      @comment = Comment.new(comment_params)
      @comment.student_id =@student.id
      if @comment.save
        # @account.student.comments << @comment
        redirect_to ucenter_course_path(@course), notice: '评价成功！'
      else
        redirect_to ucenter_course_path(@course), notice: '评价失败！'
      end
    else
        redirect_to ucenter_course_path(@course), notice: '评价失败！.'
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    set_student
    set_course
    if has_course?
      if @comment.update(comment_params)
        redirect_to ucenter_course_path(@course), notice: '修改成功！'
      else
        redirect_to ucenter_course_path(@course), notice: '修改失败！'
      end
    else
       redirect_to ucenter_course_path(@course), notice: '修改失败！.'
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:comment][:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:mark, :manner, :level, :pattern, :content, :course_id)
    end

    def has_course?
        CoursesStudent.find_by(student_id: @student, course_id: @course) && @course.stage == 'finished'
    end

    def uncomment?
        !Comment.find_by(student_id: @student, course_id: @course)
    end
end
