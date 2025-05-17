user = User.create!(
  email: "asya@gmail.com",
  password: "password"
)

projects = 20.times.map do
  Project.create!(name: Faker::Educator.unique.subject, user: user)
end

projects.each do |project|
  20.times do
    Task.create!(name: "read #{Faker::ProgrammingLanguage.unique.name}",
    project: project,
    priority: rand(0..2),
    duedate: Faker::Date.forward(days: 23)
    )
  end
end
