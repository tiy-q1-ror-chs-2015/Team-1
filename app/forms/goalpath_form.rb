class GoalpathForm < Reform::Form

  include Coercion

  property :end_goal, validates: { presence: true, length: { minimum: 5 } }

  class ArrayOfSchools < Virtus::Attribute
    def coerce(value)
      School.find(value.reject(&:empty?))
    end
  end

  property :schools, type: ArrayOfSchools
end