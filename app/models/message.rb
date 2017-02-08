class Message < ApplicationRecord

  belongs_to :group
  belongs_to :user

  def published_on
    created_at.strftime('%Y/%m/%d %H:%M:%S')
  end
end
