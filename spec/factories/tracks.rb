FactoryGirl.define do
  factory :track do
    title "A track"
    description "A track description"
    active true
    mp3{ File.new(Rails.root.join('spec', 'data', 'audio.mp3')) }
  end
end
