$(document).ready ->

  $('#reverse').click ->
    old_source = $("#source_currency").val()
    old_target = $("#target_currency").val()
    $("#source_currency").val(old_target)
    $("#target_currency").val(old_source)

  timeoutID = null

  runAjax = ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data:
          source_currency: $('#source_currency').val()
          target_currency: $('#target_currency').val()
          amount: $('#amount').val()
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val data.value.toFixed(2) + " " + $('#target_currency').val()
      return false
    return

  $('#reverse').click ->
    runAjax()

  $('#amount').keyup (e) ->
    clearTimeout timeoutID
    timeoutID = setTimeout(->
      runAjax()
      500
      return
    )
    return
  return
# --- 
