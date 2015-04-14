#zeptoBrowserify = require 'zepto-browserify'
#$ = zeptoBrowserify.$
$ = require 'jquery-browserify'
Cookies = require 'cookies-js'
serialize = require 'form-serialize'

#adress = 'info@lauffenburger-photogallery.ch'
adress = 'yassin@atelier-zuppinger.ch'

$ () ->
  $('.rsvp')
    .on 'mouseover', () ->
      $('button').addClass('hover')
    .on 'mouseout', () ->
      $('button').removeClass('hover')
    .on 'click', displayForm
  $('.close').on 'click', () ->
    hideForm(true)
  $('form').submit (event) ->
    # send via ajax or use default process
    if (typeof Object.create == 'function' && !$.browser.msie)
      datas = serialize(event.target, { hash: true})
      if datas
        attend(datas)
        event.preventDefault()
  
  new Placeholder()

displayForm = () -> 
  $('body').addClass 'displayForm'
  $('#left button, #right button').addClass('clicked')
  
hideForm = (cancel) ->
  $('body').removeClass 'displayForm'
  if !cancel
    $('body').addClass 'thanks'
  else
    $('#left button, #right button').removeClass('clicked')

attend = (datas) ->
  if !Cookies('sent')
    #console.log 'Envoi'
    $.ajax({
      url: "//formspree.io/" + adress,
      method: "POST"
      data: datas
      dataType: "json"
      success: () ->
        hideForm()
        Cookies('sent', true)
    })
  else
    alert 'Vous avez déjà répondu'
    hideForm()
