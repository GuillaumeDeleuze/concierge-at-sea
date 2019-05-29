$(function() {
    $('#new_chatroom_message').on('ajax:success', function(a, b,c ) {
      $(this).find('input[type="text"]').val('');
    });
  });
  