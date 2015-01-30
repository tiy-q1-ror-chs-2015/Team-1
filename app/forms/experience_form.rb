class ExperienceForm < Reform::Form
  property :title, validates: { presence: true }
  property :description, validates: { presence: true, length: { minimum: 50 } }
end