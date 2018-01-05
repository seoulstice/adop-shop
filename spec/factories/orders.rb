FactoryBot.define do
  factory :order do
    status 0
    sequence(:address) {|n| "street#{n}"}
    user nil
    sequence(:purchaser) {|n| "purchaser#{n}"}
  end
end
