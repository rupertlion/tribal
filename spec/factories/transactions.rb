FactoryBot.define do
  factory :transaction do
		amount { 50 }
		association :user, factory: :user
  end
end
