# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

movies = []
url = 'http://tmdb.lewagon.com/movie/top_rated'
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
user['results'].each do |result|
  movies << Movie.create!(
    title: result['title'],
    overview: result['overview'],
    poster_url: result['poster_path'],
    rating: result['vote-average']
  )
end

lists = []
5.times do
  list = List.new(
    name: Faker::Music.genre
  )
  list.save
  lists << list
end

15.times do
  bookmarks = Bookmark.new(
    movie: movies.sample,
    list: lists.sample,
    comment: Faker::Quote.yoda
  )
  bookmarks.save
end
