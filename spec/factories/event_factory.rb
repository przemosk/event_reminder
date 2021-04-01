FactoryBot.define do
  factory :event do
    name { "name_#{rand(1..99)}" }
    start_date { Time.parse(1.week.from_now.to_s) }
  end
end
