FactoryBot.define do
  factory :task do
    description { Faker::Lorem.word }
    status %i[task_pend task_done].sample
    list
   end
end
