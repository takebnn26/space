$(function(){
  function insertMessage(message) {
    var html = `<li class='chat-main__message.clearfix'>
                  <div class='chat-main__message-name'>${ message.name }</div>
                    <div class='chat-main__message-time'>${ message.time }</div>
                  <div class='chat-main__message-body'>${ message.body }</div>
                </li>`

    $('.chat-main__body--messages-list').append(html);
  };

  function insertNoticeMessage(flash) {
    var html = `<div class='notice'>${ flash }</div>`
    $('.notification').append(html);
    fadeNoticeMessage();
  };

  function fadeNoticeMessage() {
    setTimeout(function() {
      $('.notification').children().fadeOut('slow');
    }, 3000);
  };

  function scrollToBottom() {
    var pos = $('.chat-main__body--messages-list').height();
    $('.chat-main__body').animate({
      scrollTop: pos
    }, 'slow', 'swing');
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
      scrollToBottom();
      insertNoticeMessage(data.notice);
      this[0].reset();
    })
    .fail( function() {
      alert('メッセージ送信失敗');
    });
    return false;
  });
});
