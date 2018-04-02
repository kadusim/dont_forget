FactoryBot.define do
  factory :subtask do
    description { Faker::Lorem.word }
    status %i[task_pend task_done].sample
    task
   end
end
