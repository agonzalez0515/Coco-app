App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.body.blank?
      $('#chats-table').append '<div class="chat">' +
        '<div class="chat-user">' + '<p> Name: ' + data.name + '</div>' + '</p>' +
       '<div class="chat-content">' + '<p> Message: ' + data.body + '</div>' + '</div>' + '</p>' + '<br>'
      $('#chat_body').val ' ' 
      scroll_bottom = () ->
  		$('.chats').scrollTop($('#chats')[0].scrollHeight)

$(document).on 'turbolinks:load', ->
  submit_chat()
  scroll_bottom()

submit_chat = () ->
  $('#chat_body').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = " "
      event.preventDefault()

scroll_bottom = () ->
  $('#chats').scrollTop($('#chats')[0].scrollHeight)
