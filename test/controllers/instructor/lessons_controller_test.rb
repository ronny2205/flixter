require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  
  test "create lesson" do
    u1 = FactoryGirl.create(:user)
    sign_in u1
    course1 = FactoryGirl.create(:course, :user => u1)
    section1 = FactoryGirl.create(:section, :course => course1)

    assert_difference 'section1.lessons.count' do
    	post :create, :section_id => section1.id, :lesson => {
    			:title => 'Getting started', :subtitle => 'Introduction to numbers'
    	}

    end	
    assert_redirected_to instructor_course_path(course1) 

  end
end
