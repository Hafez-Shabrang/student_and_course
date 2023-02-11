class StudentsController < ApplicationController

  before_action :find_student_by_id, only: [:show, :edit, :update, :destroy]
  before_action :student_params, only: [:update, :create]
  before_action :require_login, except: [:new, :create]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Student has been created successfully"
      redirect_to login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @student.update(student_params)
      flash[:success] = "Student has been updated successfully"
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @student.destroy
      redirect_to students_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password)
  end

  def find_student_by_id
    @student = Student.find(params[:id])
  end
end
