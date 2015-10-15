require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  test "student_course show page" do
	    u1 = FactoryGirl.create(:user)
	    sign_in u1
	    course = FactoryGirl.create(:course, :user => u1)
	    get :show, :id => course.id
	    assert_response :success
  	end

  	test "student_course show page, not found" do
    	u1 = FactoryGirl.create(:user)
	    sign_in u1
    	get :show, :id => 'Ein'
    	assert_response :not_found
  	end
end
