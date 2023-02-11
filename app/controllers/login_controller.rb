class LoginController < ApplicationController

  before_action :login_redirection, only: [:new, :create]

  def new

  end

  def create
    @student = Student.find_by(email: params[:session][:email])
    if @student and @student.authenticate(params[:session][:password])
      session[:student_id] = @student.id
      redirect_to courses_path
    else
      render :new, status: :unprocessable_entity\
    end
  end

  def destroy
    session[:student_id] = nil
    redirect_to login_path
  end

  private

    def login_redirection
      if logged_in?
        redirect_to root_path
      end
    end

end
