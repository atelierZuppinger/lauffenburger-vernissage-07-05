zeptoBrowserify = require 'zepto-browserify'
$ = zeptoBrowserify.$
Cookies = require('./cookie.js')

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
  $('#left button, #right button').addClass('clicked')
  attend()
hideForm = () ->
  $('body').removeClass 'displayForm'
attend = () ->
  if !Cookies('sent')
    $.ajax({
      url: "//formspree.io/yassin@atelier-zuppinger.ch",
      type: "POST"
      data: 
        _subject: 'Confirmation d\'inscription'
        message: "Nouvelle inscription au vernissage du 7 mai"
      dataType: "json"
      success: () ->
        hideForm
        Cookies('sent', true)
    })
  
