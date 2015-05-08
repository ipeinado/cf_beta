# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

console.log 'Hello hello hello'
$(document).ready ->
  $('.main').onepage_scroll
    sectionContainer: 'section'
    easing: 'ease'
    animationTime: 1000
    pagination: false
    updateURL: false
    beforeMove: (index) ->
    afterMove: (index) ->
    loop: false
    keyboard: true
    responsiveFallback: false
    direction: 'vertical'
  return
