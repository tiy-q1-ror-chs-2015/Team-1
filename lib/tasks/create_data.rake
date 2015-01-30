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
  
  end


end