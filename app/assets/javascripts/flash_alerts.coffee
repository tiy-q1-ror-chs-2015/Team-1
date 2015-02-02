$.showAlert = (title, type)->
  swal({
    title: title,
    type: coerceSweetalertType(type),
    timer: 5000,
    showCancelButton: false
  })

coerceSweetalertType = (type)->
  if type == 'notice' then type = 'success'
  if type not in ['warning', 'error', 'success', 'info'] then type = 'info'
  type

$ ->
  if $('body').attr('data-flash-title')
    $.showAlert($('body').data('flash-title'), $('body').data('flash-type'))