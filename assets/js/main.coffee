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
  $('#left button, #right button').addClass('clicked')
  attend()
hideForm = () ->
  $('body').removeClass 'displayForm'
attend = () ->
  $.ajax({
    url: "//formspree.io/yassin@atelier-zuppinger.ch",
    type: "POST"
    data: 
      _subject: 'Confirmation d\'inscription'
      message: "Nouvelle inscription au vernissage du 7 mai"
    dataType: "json"
    success: () ->
      showThanksMessage()
      hideForm
  })
