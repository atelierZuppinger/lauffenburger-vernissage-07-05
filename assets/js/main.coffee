#zeptoBrowserify = require 'zepto-browserify'
#$ = zeptoBrowserify.$
$ = require 'jquery-browserify'
Cookies = require 'cookies-js'
serialize = require 'form-serialize'

adress = 'info@lauffenburger-photogallery.ch'
#adress = 'yassin@atelier-zuppinger.ch'

$ () ->
  $('.rsvp')
    .on 'mouseover', () ->
      $('button').addClass('hover')
    .on 'mouseout', () ->
      $('button').removeClass('hover')
    .on 'click', displayForm
  $('.close')
    .on('click', hideForm)
  $('form').submit (event) ->
    event.preventDefault()
    attend(event.target)

displayForm = () -> 
  $('body').addClass 'displayForm'
  $('#left button, #right button').addClass('clicked')
  
hideForm = () ->
  $('body').removeClass 'displayForm'
  $('body').addClass 'thanks'
attend = (form) ->
  if !Cookies('sent')
    #console.log 'Envoi'
    datas = serialize(form, { hash: true})
    datas._subject = 'Réponse à l\'invitation'
    $.ajax({
      url: "//formspree.io/" + adress,
      type: "POST"
      data: datas
      dataType: "json"
      success: () ->
        hideForm()
        Cookies('sent', true)
    })
  else
    alert 'Vous avez déjà répondu'
    hideForm()
