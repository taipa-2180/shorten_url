class Url < ApplicationRecord
  validates :original_url, presence: true
  validates :code, uniqueness: true

  before_create :generate_code

  private

  def generate_code
    loop do
      self.code = SecureRandom.hex(5)
      break unless self.class.exists?(code: code)
    end
  end
end
