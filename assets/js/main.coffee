zeptoBrowserify = require 'zepto-browserify'
$ = zeptoBrowserify.$

$ () ->
  $('.rsvp')
    .on 'mouseover', () ->
      $('button').addClass('hover')
    .on 'mouseout', () ->
      $('button').removeClass('hover')
    .on 'click', displayForm
  $('.close')
    .on('click', hideForm)

displayForm = () -> 
  $('body').addClass 'displayForm'
hideForm = () ->
  $('body').removeClass 'displayForm'
attend = () ->
  $.ajax
    url: "//formspree.io/you@email.com", 
    method: "POST",
    data: {message: "hello!"},
    dataType: "json"
