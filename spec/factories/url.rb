FactoryBot.define do
  factory :url do
    original_url { "http://google.com" }
    code { "123456" }
  end
end