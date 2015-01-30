task create_student: :environment do 
  5.times do
    new_student = Student.create!({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
      })
      new_student.create_address( 
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country
      )
    
      2.times do
      new_student.essays.create ({
      topic: Faker::Lorem.word,
      content: Faker::Lorem.paragraph

      })

      new_student.experiences.create ({
      title: Faker::Lorem.word,
      description: Faker::Lorem.paragraph
      })

      new_student.skills.create ({
      skill_name: Faker::Lorem.word,
      description: Faker::Lorem.paragraph
      })
      end
  end
  


end