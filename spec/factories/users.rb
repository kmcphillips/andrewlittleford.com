FactoryGirl.define do
  factory :user do
    sequence(:username){|i| "user#{ i }" }
    password_hash Digest::SHA1.hexdigest('password')
    sequence(:name){|i| "Mr User#{ i }" }
    sequence(:email){|i| "user#{ i }@example.com" }
  end
end
