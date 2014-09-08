FactoryGirl.define do
  factory :link do
    title "The title"
    sequence(:url){|i| "http://test.com/thing/#{ i }"}
    description "A link"
    sequence(:sort_order){|i| i }
    project false
  end
end
