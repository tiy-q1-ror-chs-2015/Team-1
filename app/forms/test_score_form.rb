class Test_ScoreForm < Reform::Form
  include Coercion

  property :score, validates: { presence: true }
  property :date_taken, type: Date, validates: { presence: true }
  property :test_type, validates: { presence: true }
end