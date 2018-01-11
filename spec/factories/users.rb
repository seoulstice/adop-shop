FactoryBot.define do
  factory :user do
    password "password"
    sequence(:username) {|n| "username#{n}"}
    role 0
    address "address"
    city "city"
    state "CO"
    zipcode 12345
    sequence(:name) {|n| "Unique#{n}"}
    orders_count 0
  end
end
