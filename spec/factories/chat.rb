FactoryBot.define do
  factory :chat do
    association :user
    association :room
    message {Faker::Lorem.sentence}
  end
end