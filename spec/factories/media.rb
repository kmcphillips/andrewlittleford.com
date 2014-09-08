FactoryGirl.define do
  factory :media do
    label "press_kit"
    file File.open(File.join(Rails.root, 'spec', 'data', 'pie.jpg'))
  end
end
