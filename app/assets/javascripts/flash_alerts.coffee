coerceSweetalertType = (type)->
  type = 'success' if type == 'notice'

$ ->
  if $('body').attr('data-flash-title')
    swal({
      title: $('body').data('flash-title'),
      type: coerceSweetalertType($('body').data('flash-type')),
      timer: 5000,
      showCancelButton: false
    })