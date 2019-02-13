FactoryBot.define do
  factory :user do
    password { 'password' }
    
    factory :trainee do
      sequence(:first_name) { |n| "John#{n}" }
      last_name { 'Doe' }
      sequence(:email) { |n| "trainee#{n}@mail.com" }
      role { :trainee }
    end

    factory :coach do
      sequence(:first_name) { |n| "Jane#{n}" }
      last_name { 'Doe' }
      sequence(:email) { |n| "coach#{n}@mail.com" }
      role { :coach }
    end
  end
end