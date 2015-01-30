coerceSweetalertType = (type)->
  if type == 'notice' then type = 'success'
  if type not in ['warning', 'error', 'success', 'info'] then type = 'info'
  type

$ ->
  if $('body').attr('data-flash-title')
    swal({
      title: $('body').data('flash-title'),
      type: coerceSweetalertType($('body').data('flash-type')),
      timer: 5000,
      showCancelButton: false
    })