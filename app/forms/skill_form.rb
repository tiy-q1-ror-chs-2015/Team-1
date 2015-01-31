class SkillForm < Reform::Form
  property :skill_name, validates: { presence: true }
  property :description, validates: { presence: true, length: { minimum: 50 } }
end