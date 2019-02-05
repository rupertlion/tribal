FactoryBot.define do
  factory :transaction do
		amount { 50 }
		association :user, factory: :user
		association :session, factory: :session
  end
end
