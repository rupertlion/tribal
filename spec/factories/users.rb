FactoryBot.define do
  factory :user do
    first_name { 'Jon' }
    last_name { 'Doe' }
    sequence(:email) { |n| "email#{n}@mail.com" }
    password { 'password' }
		role { 1 }
  end
end
