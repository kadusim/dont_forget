FactoryBot.define do
  factory :task do
    description { Faker::Lorem.word }
    status %i[task_pend task_done].sample
    list
   end

  factory :task_child, class: Task do
    description { Faker::Lorem.word }
    status %i[task_pend task_done].sample
    father factory: :task
    list
  end
end
