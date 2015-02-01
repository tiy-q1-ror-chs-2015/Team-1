$ ->
  selects = $('[data-selectize-standard]')
  $(select).selectize() for select in selects

  for select in $('select.selectize-school-list')
    $(select).selectize({
      valueField: 'id',
      labelField: 'school_name',
      searchField: 'school_name',
      dataType: 'json',
      create: false,
      load: (query, callback) ->
        return callback() unless query.length
        $.ajax({
          url: "/schools/search/?query=#{encodeURIComponent(query)}",
          type: 'GET',
          error: ->
            console.log 'error'
            callback()
          ,
          success: (res)->
            console.log res
            console.log res.response
            callback(res)
        })
    })