FactoryGirl.define do
  factory :image do
    label "A pie"
    active true
    sort_order 1
    file File.open(File.join(Rails.root, 'spec', 'data', 'pie.jpg'))
    gallery
  end
end
