FactoryBot.define do
  factory :list do
    name { Faker::Lorem.word }
    type_access %i[list_shared list_private].sample
    status %i[list_pend list_done].sample
    user
   end
end
