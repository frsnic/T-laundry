# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.copy', ->
  n = $("#new_quantity").val()
  while n
    $(".add_nested_fields").click()
    n--
  total = 0
  $(".price:visible").each ->
    total = total + parseInt( $(this).val() )
    console.log(total)
  $("#order_price").val(total)
  return

$(document).on 'nested:fieldAdded', (event) ->
  event.field.find('.cloth_title').val( $("#new_cloth_title").val() )
  event.field.find('.price').val( $("#new_price").val() )
  return

$(document).on 'nested:fieldRemoved', (event) ->
  total = $("#order_price").val() - event.field.find('.price').val()
  $("#order_price").val(total)
  return
