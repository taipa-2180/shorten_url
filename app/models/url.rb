class Url < ApplicationRecord
  validates :original_url, :code, presence: true
end
