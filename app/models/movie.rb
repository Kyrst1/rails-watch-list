class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  def full_url
    "https://image.tmdb.org/t/p/original/#{poster_url}"
  end
end
