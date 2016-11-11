class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user_course_inprogress = @user.user_courses.inprogress
    @user_course_finish = @user.user_courses.finished
    if @user_course_inprogress.present?
      @courses = Course.course @user_course_inprogress.course_id
    end
  end
end
