FactoryGirl.define do
  factory :media do
    label "press_kit"
    file File.open(File.join(Rails.root, 'spec', 'fixtures', 'pie.jpg'))
  end
end
