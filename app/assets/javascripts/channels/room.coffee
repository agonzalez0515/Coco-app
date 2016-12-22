App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.body_es.blank?
      $('#chats-table').append '<div class="chat">' +
        '<div class="chat-user">' + '<p>' + data.name + " at " + data.created_at + ":" + '</p>' + '</div>' +
        '<div class="chat-content-en">' + '<p>' + data.body_en + '</p>' + '</div>' +
        '<div class="chat-content-es">' + '<p>' + data.body_es + '</p>' + '</div>' + '<br>'
      $('#chat_body').val ' '
      scroll_bottom = () ->
      $('#chats').scrollTop($('#chats')[0].scrollHeight)

$(document).on 'turbolinks:load', ->
  scroll_bottom()
  submit_chat()

submit_chat = () ->
  $('#chat_body').on 'keydown', (event) ->
    if event.keyCode is 13
      event.preventDefault()
      $('input').click()
      event.target.value = " "

scroll_bottom = () ->
  $('#chats').scrollTop($('#chats')[0].scrollHeight)
