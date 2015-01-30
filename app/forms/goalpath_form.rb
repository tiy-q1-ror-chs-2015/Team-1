class GoalpathForm < Reform::Form
  property :end_goal, validates: { presence: true, length: { minimum: 5 } }

  collection :schools
end