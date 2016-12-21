App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.body_es.blank?
      $('#chats-table').append '<div class="chat">' +
        '<div class="chat-user">' + '<p>' + data.name + ":" + '</p>' + '</div>' +
        '<div class="chat-content-en">' + '<p>' + data.body_en + '</p>' + '</div>' + '</div>' +
        '<div class="chat-content-es">' + '<p>' + data.body_es + '</p>' + '</div>' + '</div>' + '<br>'
      $('#chat_content').val ' '
      scroll_bottom = () ->
  			# $('#chats').scrollTop($('#chats')[0].scrollHeight)

$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#chat_body').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = " "
      event.preventDefault()

scroll_bottom = () ->
  # $('#chats').scrollTop($('#chats')[0].scrollHeight)
