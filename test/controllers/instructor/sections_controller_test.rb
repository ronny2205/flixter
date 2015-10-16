require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
 test "create section" do
    u1 = FactoryGirl.create(:user)
    sign_in u1
    course = FactoryGirl.create(:course, :user => u1)

    assert_difference 'course.sections.count' do
    	post :create, :course_id => course.id, :section => {
    			:title => 'Week four'
    	}

    end	
    assert_redirected_to instructor_course_path(course) 

  end
end
