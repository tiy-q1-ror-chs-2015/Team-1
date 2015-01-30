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

task create_school: :environment do
  3.times do
    new_school = School.create!({
    application_deadline: Faker::Date.forward(50),      
    average_sat: Faker::Number.number(4),     
    average_act: Faker::Number.number(2),   
    school_name: Faker::Name.name,    
    student_population: Faker::Number.between(2,5),        
    city: Faker::Address.city,      
    state: Faker::Address.state,      
    comment: Faker::Lorem.sentence
    })
  end  
end