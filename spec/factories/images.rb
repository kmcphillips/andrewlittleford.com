FactoryGirl.define do
  factory :image do
    label "A pie"
    active true
    file File.open(File.join(Rails.root, 'spec', 'fixtures', 'pie.jpg'))
  end
end
