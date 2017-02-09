$(function(){
  $('.notification').empty();

  function insertMessage(message) {
    var html = `<div class='chat-main__message.cleafix'>
                  <div class='chat-main__message-name'>${ message.name }</div>
                    <div class='chat-main__message-time'>${ message.time }</div>
                  <div class='chat-main__message-body'>${ message.body }</div>
                </div>`

    $('.chat-main__body--messages-list').append(html);
  };

  function insertNoticeMessage(flash) {
    var html = `<div class='notice'>${ flash }</div>`
    $('.notification').append(html);
  };

  $('#message-form').on('submit', function(e) {
    e.preventDefault();
    $('.notification').empty();
    var $messageBodyField = $('#message_body');
    var $messageSubmitBtn = $('#message-submit');
    var messageBody       = $messageBodyField.val();

    $.ajax ({
      url: './messages',
      type: 'post',
      data: { message: { body: messageBody }},
      dataType: 'json'
    })
    .done( function(data) {
      insertMessage(data);
      insertNoticeMessage(data.notice);
      $messageBodyField.val('');
      $messageSubmitBtn.prop('disabled', false);
    })
    .fail( function() {
      $messageSubmitBtn.prop('disabled', false);
      alert('メッセージ送信失敗');
    });
  });
});
