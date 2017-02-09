$(function(){
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

  function fadeNoticeMessage() {
    setTimeout(function() {
      $('.notification').children().fadeOut('slow');
    }, 3000);
  };

  $('#message-form').on('submit', function(e) {
    e.preventDefault();

    $.ajax ({
      url: './messages',
      type: 'post',
      data: { message: { body: $('#message_body').val() }},
      dataType: 'json',
      context: $(this)
    })
    .done( function(data) {
      insertMessage(data);
      insertNoticeMessage(data.notice);
      fadeNoticeMessage();
      this[0].reset();
    })
    .fail( function() {
      alert('メッセージ送信失敗');
    });
    return false;
  });
});
