$ ->
  for el in $('[data-hover-content]')
    $(el).data('off-hover-content', $(el).text())
    $(el).on 'mouseover', =>
      $(el).text($(el).data('hover-content'))
    $(el).on 'mouseout', =>
      $(el).text($(el).data('off-hover-content'))