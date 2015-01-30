task create_states: :environment do
  require 'CSV'

  raw_states = CSV.parse(File.open('./db/seed_data/states.csv')).flatten.map { |state| state.split("\t") }
  raw_states.each { |s| State.create!(name: s[0], abbreviation:s[1], country:case s[2] when 'USA' then 'USA' else 'CN' end, classification:s[3], sort:s[4]) }
end