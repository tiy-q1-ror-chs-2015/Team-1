$ ->
  if $('body').attr('data-flash-title')
    swal({
      title: $('body').data('flash-title'),
      type: $('body').data('flash-type'),
      timer: 5000,
      showCancelButton: false
    })