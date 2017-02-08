$(function(){

  function insertMessage(message) {
    var html = `<div class='chat-main__message.cleafix'>
                  <div class='chat-main__message-name'>${ message.name }</div>
                    <div class='chat-main__message-time'>${ message.time }</div>
                  <div class='chat-main__message-body'>${ message.body }</div>
                </div>`

    $('.chat-main__body--messages-list').append(html);
  };

  $('#message-form').on('submit', function(e) {
    e.preventDefault();
    var $messageBodyField   = $('#message_body');
    var messageBody = $messageBodyField.val();

    $.ajax ({
      url: './messages',
      type: 'post',
      data: { message: { body: messageBody }},
      dataType: 'json'
    })
    .done( function(data) {
      insertMessage(data);
      $messageBodyField.val('');
      $('#message-submit').prop('disabled', false);
    })
    .fail( function() {
      alert('メッセージ送信に失敗しました');
    });
  });
});
