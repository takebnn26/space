class Message < ApplicationRecord

  belongs_to :group
  belongs_to :user

  def published_on
    created_at.to_s(:default)
  end
end
