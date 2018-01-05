FactoryBot.define do
  factory :dog do
    sequence(:name) {|n| "Fido#{n}"}
    sequence(:breed) {|n| "Breed#{n}"}
    size [0,1,2].sample
    sequence(:weight) {|n| n}
    cat_friendly [true,false].sample
    gender [0,1].sample
    description "Woof woof"
    price [50,100,150].sample 
  end
end
