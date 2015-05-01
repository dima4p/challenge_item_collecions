# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', 'body.users a.password_change', ->
  $(this).closest('div').hide()
  $(this).closest('.form-inputs').find('div.password').show().children().removeClass('disabled').removeAttr('disabled')
  false
