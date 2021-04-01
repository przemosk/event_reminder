FactoryBot.define do
  factory :user do
    email { "super_user_#{rand(1..99)}@test.com" }
  end
end

