FactoryGirl.define do
  factory :gallery do
    name "Pies"
    path "pies"
    sequence(:sort_order){|i| i }
  end
end
