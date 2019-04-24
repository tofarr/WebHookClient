class WebHook < ApplicationRecord

  validates :url, presence: true
  validates :method, presence: true, inclusion: { in: %w(get post patch delete) }
  validates :model_type, presence: true
  validates :event_type, presence: true, inclusion: { in: %w(create update destroy) }
  validates :auth_type, presence: true, inclusion: { in: %w(none basic jwt) }
end
