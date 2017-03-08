$(document).on 'turbolinks:load', ->
  chat_appender

chat_appender = (body) ->
  $('#chats-table').append body



