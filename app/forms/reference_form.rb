class ReferenceForm < Reform::Form

  include Coercion
  # def date= date 
  #   date = Date.parse(date)
  # end
  property :name, validates: { presence: true }
  property :relation_to_student, validates: { presence: true }
  property :date, type: Date, validates: { presence: true }
  property :content, validates: { presence: true, length: { minimum: 50 } }
end