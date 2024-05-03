10.times do
  Task.create(
    name: Faker::Lorem.words(number: rand(1..2)).join(" "),
    description: Faker::Lorem.paragraphs(number: rand(2..3)).join("\n\n"),
    status: %i(in_progress cancelled test done).sample,
    creator: Faker::Name.unique.name,
    performer: Faker::Name.unique.name,
    completed: Faker::Boolean.boolean,
  )
end

# Таска без статуса
Task.create(
  name: Faker::Lorem.words(number: rand(1..2)).join(" "),
  description: Faker::Lorem.paragraphs(number: rand(2..3)).join("\n\n"),
  creator: Faker::Name.unique.name,
  performer: Faker::Name.unique.name,
  completed: Faker::Boolean.boolean,
)