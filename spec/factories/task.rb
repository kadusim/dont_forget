FactoryBot.define do
  factory :task do
    description { Faker::Lorem.word }
    status %i[open done].sample
    list
   end

  factory :task_child, class: Task do
    description { Faker::Lorem.word }
    status %i[open done].sample
    father factory: :task
    list
  end
end
