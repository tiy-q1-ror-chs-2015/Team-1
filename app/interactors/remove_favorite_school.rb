class RemoveFavoriteSchool
  include Interactor::Organizer

  organize GetStudentForUser, UnmarkSchoolAsFavorite

end