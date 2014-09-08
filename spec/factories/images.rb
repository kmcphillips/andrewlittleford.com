FactoryGirl.define do
  factory :image do
    label "A pie"
    active true
    file File.open(File.join(Rails.root, 'spec', 'data', 'pie.jpg'))
    gallery
  end
end
