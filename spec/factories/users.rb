FactoryBot.define do
  factory :user do
    password "password"
    sequence(:username) {|n| "username#{n}"}
    role 0
  end
end
