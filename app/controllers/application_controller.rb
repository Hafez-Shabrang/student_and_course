class ApplicationController < ActionController::Base

  helper_method :current_student, :logged_in?

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_student
  end

  def require_login
    if !logged_in?
      redirect_to login_path
    end
  end

end
