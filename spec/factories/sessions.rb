# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    title { 'CrossFit' }
    start_date { '2019-01-30 19:00:00' }
    end_date { '2019-01-30 19:30:00' }
		price {}
		association :coach, factory: :coach
    association :price_table, factory: :price_table
  end
end
