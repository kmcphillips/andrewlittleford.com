FactoryGirl.define do
  factory :block do
    body "The bio"
    sequence(:label){|i| "bio#{ i }" }
    path 'bio_path'
  end
end
