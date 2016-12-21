chat_appender = (body) ->
  $('#chats-table').append body

$(document).on 'turbolinks:load', ->
  chat_appender
