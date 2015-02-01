task create_schools: :environment do
  College = Struct.new(:id, :name, :number_of_applicants, :number_admitted, :number_admitted_enrolled, :percent_applicants_admitted, :percent_applicants_enrolled, :percentile_25_sat_verbal, :percentile_75_sat_verbal, :percentile_25_sat_math, :percentile_75_sat_math, :percentile_25_act_composite, :percentile_75_act_composite, :percentile_25_act_english, :percentile_75_act_english, :percentile_25_act_math, :percentile_75_act_math, :total_enrollment, :street, :city, :state, :zip, :website)

  # Data taken from a number of reports off of IPEDS Data Center
  colleges = Marshal.load(File.new('./lib/tasks/data_sources/marshalled_colleges.data'))

  colleges.each do |_irrelevant_id, college|
    s = School.create!({
              school_name: college.name,
              number_of_applicants: college.number_of_applicants,
              number_admitted: college.number_admitted,
              number_admitted_enrolled: college.number_admitted_enrolled,
              percent_applicants_enrolled: college.percent_applicants_enrolled,
              percent_applicants_admitted: college.percent_applicants_admitted,
              percentile_25_sat_verbal: college.percentile_25_sat_verbal,
              percentile_75_sat_verbal: college.percentile_75_sat_verbal,
              percentile_25_sat_math: college.percentile_25_sat_math,
              percentile_75_sat_math: college.percentile_75_sat_math,
              percentile_75_act_composite: college.percentile_75_act_composite,
              percentile_25_act_composite: college.percentile_25_act_composite,
              percentile_25_act_english: college.percentile_25_act_english,
              percentile_75_act_english: college.percentile_75_act_english,
              percentile_25_act_math: college.percentile_25_act_math,
              percentile_75_act_math: college.percentile_75_act_math,
              student_population: college.total_enrollment,
              website: college.website
                       })
    if college.city
      a = s.create_address(street: college.street, city: college.city, zip: college.zip, state_id: State.find_by(abbreviation: college.state).id)
    end
  end

  # maps differently
  #  total_enrollment => student_population
  #  address data
  #  name => school_name
end