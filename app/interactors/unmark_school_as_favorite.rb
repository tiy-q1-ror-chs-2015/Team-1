class UnmarkSchoolAsFavorite
  include Interactor

  def call
    # First check if the student already has the school marked
    context.fail!(message: 'This school is not a favorite!') unless context.student.schools.include?(context.school)

    # Otherwise, we should be able to associate it just fine
    if context.student.schools.delete(context.school)
      context.message = 'School removed!'
    else
      context.fail!(message: 'An unknown error occurred.')
    end
  end
end