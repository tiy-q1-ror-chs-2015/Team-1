class GoalpathForm < Reform::Form

  include Coercion

  property :end_goal, validates: { presence: true, length: { minimum: 5 } }

  class ArrayOfSchools < Virtus::Attribute
    # ["1","2","4"] -> [School, School, School]
    def coerce(value)
      School.find(value.reject(&:empty?))
    end
  end

  property :schools, type: ArrayOfSchools
end