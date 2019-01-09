FactoryGirl.define do
  factory :product do
    name "MyString"
    description "MyText"
    pricing "9.99"
    association :user, factory: :user
  end
end
