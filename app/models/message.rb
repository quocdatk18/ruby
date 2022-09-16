class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # after_create_commit :broadcast_message
  validates :content, presence: true

  private

  def broadcast_message
    # MessageBroadcastJob.perform_later self
  end
end
