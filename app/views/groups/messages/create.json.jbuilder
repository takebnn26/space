json.name @message.user.name
json.time @message.created_at.to_s(:default)
json.body @message.body
json.image @message.image.url
json.notice flash.now[:notice]
