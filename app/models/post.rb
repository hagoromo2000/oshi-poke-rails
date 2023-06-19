class Post < ApplicationRecord
  validates :name, presence: true
  validates :author_name, presence: true
  validates :image_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :body, presence: true
end
