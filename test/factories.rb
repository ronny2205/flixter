FactoryGirl.define do  factory :enrollment do
    
  end
  

  factory :lesson do
    title "sin function"
    subtitle "everything about sinus"
    association :section
  end 

  factory :section do
     title "Week three"
     association :course
  end


  factory :user do
    sequence :email do |n|
      "lulu#{n}@gmail.com"
    end

    password "lalalala"
    password_confirmation "lalalala"
  end

  factory :course do
    title "Advanced Trig"
    description "Trig funcyions in action"
    cost "300"
    association :user
  end

  
end