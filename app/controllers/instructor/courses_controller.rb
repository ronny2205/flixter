class Instructor::CoursesController < ApplicationController
	before_action :authenticate_user!
   before_action :require_authorized_for_current_course, :only => [:show]

	def new
		@course = Course.new
	end	

	def create
	    @course = current_user.courses.create(course_params)
	    if @course.valid?
      		redirect_to instructor_course_path(@course)
    	else
      		render :new, :status => :unprocessable_entity
    	end
  	end

  	def show
    	# @course = Course.where(:id => params[:id]).first
	    if current_course.blank?
	      render :text => "404 Not Found", :status => :not_found
	    end
  	end

  	private
    def require_authorized_for_current_course
      if current_course.user != current_user
        render :text => "Unauthorized", :status => :unauthorized
      end
    end

    helper_method :current_course
    def current_course
      #@current_course ||= Course.find(params[:id])
      @current_course ||= Course.where(:id => params[:id]).first
      
    end

  	def course_params
    	params.require(:course).permit(:title, :description, :cost)
  	end
end