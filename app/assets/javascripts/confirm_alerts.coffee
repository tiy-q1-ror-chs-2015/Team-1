$.rails.showConfirmationDialog = (link) ->
  swal({
      title: 'Are you sure?',
      text: 'This action cannot be undone.',
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      closeOnConfirm: false
    },
    () =>
      $.rails.confirmed(link)
  )


$.rails.allowAction = (link) ->
  return true unless $(link).attr('data-confirm')
  $.rails.showConfirmationDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')