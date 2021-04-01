(1..20).each do
  User.create(email: "some_user_#{rand(1..99)}@test.com")
end

(1..10).each do |i|
  start_date = Time.now + i.day
  Event.create!(
    name: "some event nr #{rand(1..99)}",
    start_date: start_date
  )
end
