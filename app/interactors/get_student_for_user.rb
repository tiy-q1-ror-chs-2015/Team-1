class GetStudentForUser
  include Interactor

  def call
    unless context.student = context.user.student
      context.fail!(message: 'The current user has no student account.')
    end
  end
end