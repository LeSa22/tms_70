password = "123456"
User.create!(name: "Admin",
  email: "admin@gmail.com",
  password: password,
  password_confirmation: password,
  role: 2)
User.create!(name: "User",
  email: "user@gmail.com",
  password: password,
  password_confirmation: password,
  role: 0)
User.create!(name: "suppervirol",
  email: "sp@gmail.com",
  password: password,
  password_confirmation: password,
  role: 1)

5.times do |n|
  name = Faker::Name.name
  email = "trainer-#{n+1}@gmail.com"
  password = password
  password_confirmation = password
  User.create!(name: name, email: email, password: password,
    password_confirmation: password, role: 0)
end
10.times do |n|
  name = Faker::Name.title
  description = Faker::Hipster.sentences(1)
  img = Faker::Avatar.image
  start_date = "2016-11-6"
  end_date = "2016-11-18"
  c = Course.create!(name: name, description: description, image: img, start_date: start_date,
    end_date: end_date)
  1.times do
    name = Faker::Name.name_with_middle
    email = "trainee-#{n+1}@gmail.com"
    password = password
    password_confirmation = password
    u = User.create!(name: name, email: email, password: password,
     password_confirmation: password, role: 0)
    start_date_courses = "2016-11-6"
    end_date_courses = "2016-11-15"
    user_course = c.user_courses.build(user_id: u.id, start_date: start_date_courses, end_date: end_date_courses)
    user_course.save!
    1.times do |n|
      name = Faker::Team.name
      description = Faker::Hipster.sentence
      img = Faker::Avatar.image
      sb = Subject.create!(name: name, description: description, image: img)
      1.times do
        course_subject = c.course_subjects.build(subject_id: sb.id)
        course_subject.save!
      end
      start_date_subject = "2016-11-6"
      end_date_subject = "2016-11-8"
      user_subject = sb.user_subjects.build(user_id: u.id, user_course_id: user_course.id,  start_date: start_date_subject, end_date: end_date_subject)
      user_subject.save!
      5.times do
        name = Faker::Book.title
        description = Faker::Hipster.sentence(2)
        task = sb.tasks.build(name: name, description: description)
        task.save!
        1.times do
          user_task = task.user_tasks.build(user_id: u.id, user_subject_id: user_subject.id)
          user_task.save!
        end
      end
    end
  end
end
