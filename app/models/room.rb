class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  # after_create_commit { broadcast_append_to 'rooms' }
end
