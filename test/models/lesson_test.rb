require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "next lesson test" do
    u1 = FactoryGirl.create(:user)
    # sign_in u1
    course1 = FactoryGirl.create(:course, :user => u1)
    section1 = FactoryGirl.create(:section, :course => course1)
    lesson1 = FactoryGirl.create(:lesson, :section => section1)
    lesson2 = FactoryGirl.create(:lesson, :section => section1)
    expected = lesson2
    actual = lesson1.next_lesson
    assert_equal expected, actual
  end
end
