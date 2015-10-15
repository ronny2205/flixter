require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase

	 test "course show page" do
	    u1 = FactoryGirl.create(:user)
	    sign_in u1
	    course = FactoryGirl.create(:course, :user => u1)
	    get :show, :id => course.id
	    assert_response :success
  	end

    test "course show page, not found" do
    	u1 = FactoryGirl.create(:user)
	    sign_in u1
    	get :show, :id => 'Ein'
    	assert_response :not_found
  	end



  test "create course" do
    u1 = FactoryGirl.create(:user)
    sign_in u1
    #course = FactoryGirl.create(:course, :user => u1)

    assert_difference 'Course.count' do
    	post :create, :course => {
    			:title => 'Pre Geometry',
    			:description => 'Basic geometric shapes',
    			:cost => '100'
    	}

    end	
    #assert_redirected_to instructor_course_path(???)

  end

end
