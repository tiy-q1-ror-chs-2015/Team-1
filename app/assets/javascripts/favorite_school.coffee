$.toggleFavoriteButtons = (id)->
  console.log id
  $("#favorite-#{id}").toggle()
  $("#unfavorite-#{id}").toggle()