class CoursesController < ApplicationController

  before_action :find_course_by_id, only: [:show, :edit, :update, :destroy]
  before_action :course_params, only: [:update, :create]
  before_action :require_login

  def index
    # @courses = Course.all
    @courses = current_student.courses
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      StudentCourse.create(student_id:current_student.id, course_id:@course.id)
      flash[:success] = "Course has been created successfully"
      redirect_to @course
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @course.update(course_params)
      flash[:success] = "Course has been updated successfully"
      redirect_to @course
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @course.destroy
      redirect_to courses_path
    end
  end

  private

  def course_params
    params.require(:course).permit(:short_name, :name, :description)
  end

  def find_course_by_id
    @course = Course.find(params[:id])
  end



end
