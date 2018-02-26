FactoryBot.define do
  factory :list do
    name { Faker::Lorem.word }
    type_access %i[shared_all private_me].sample
    status %i[pend done].sample
    user
   end
end
