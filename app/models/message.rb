class Message < ApplicationRecord

  belongs_to :group
  belongs_to :user

  validates :body, presence: true

  def published_on
    created_at.to_s(:default)
  end
end
