# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'uri'
require 'net/http'
require 'openssl'

type = "movie"
# type = "series"

################# NETFLIX #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=netflix&type=#{type}&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'c2c95fa4d1mshbce08ebcc8b6ab0p197b68jsn270eb18d8709'
request["X-RapidAPI-Host"] = 'streaming-availability.p.rapidapi.com'

response = http.request(request)
variable = response.read_body
post = JSON.parse(variable)
netflixs = post['results']

netflixs.each do |netflix|
  Movie.create(name: netflix['originalTitle'], description: netflix['overview'], imdb_rating: netflix['imdbRating'], image_url: netflix['posterURLs']['original'], release_date: netflix['year'], genre: netflix['genres'][1], video_url: netflix['streamingInfo']['netflix']['gb']['link'], platform: "Netflix")
end

################# AMAZON #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=prime&type=#{type}&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'c2c95fa4d1mshbce08ebcc8b6ab0p197b68jsn270eb18d8709'
request["X-RapidAPI-Host"] = 'streaming-availability.p.rapidapi.com'

response = http.request(request)
variable = response.read_body
post = JSON.parse(variable)
primes = post['results']

primes.each do |prime|
  Movie.create(name: prime['originalTitle'], description: prime['overview'], imdb_rating: prime['imdbRating'], image_url: prime['posterURLs']['original'], release_date: prime['year'], genre: prime['genres'][1], video_url: prime['streamingInfo']['prime']['gb']['link'], platform: "Amazon Prime")
end

################# DISNEY #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=disney&type=#{type}&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'c2c95fa4d1mshbce08ebcc8b6ab0p197b68jsn270eb18d8709'
request["X-RapidAPI-Host"] = 'streaming-availability.p.rapidapi.com'

response = http.request(request)
variable = response.read_body
post = JSON.parse(variable)
disneys = post['results']

disneys.each do |disney|
  Movie.create(name: disney['originalTitle'], description: disney['overview'], imdb_rating: disney['imdbRating'], image_url: disney['posterURLs']['original'], release_date: disney['year'], genre: disney['genres'][1], video_url: disney['streamingInfo']['disney']['gb']['link'], platform: "Disney +")
end

################# APPLE #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=apple&type=#{type}&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'c2c95fa4d1mshbce08ebcc8b6ab0p197b68jsn270eb18d8709'
request["X-RapidAPI-Host"] = 'streaming-availability.p.rapidapi.com'

response = http.request(request)
variable = response.read_body
post = JSON.parse(variable)
apples = post['results']

apples.each do |apple|
  Movie.create(name: apple['originalTitle'], description: apple['overview'], imdb_rating: apple['imdbRating'], image_url: apple['posterURLs']['original'], release_date: apple['year'], genre: apple['genres'][1], video_url: apple['streamingInfo']['apple']['gb']['link'], platform: "Apple TV")
end

################# NOW #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=now&type=#{type}&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'c2c95fa4d1mshbce08ebcc8b6ab0p197b68jsn270eb18d8709'
request["X-RapidAPI-Host"] = 'streaming-availability.p.rapidapi.com'

response = http.request(request)
variable = response.read_body
post = JSON.parse(variable)
nows = post['results']

nows.each do |now|
  Movie.create(name: now['originalTitle'], description: now['overview'], imdb_rating: now['imdbRating'], image_url: now['posterURLs']['original'], release_date: now['year'], genre: now['genres'][1], video_url: now['streamingInfo']['now']['gb']['link'], platform: "NOW TV")
end

################# ALL 4 #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=all4&type=#{type}&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'c2c95fa4d1mshbce08ebcc8b6ab0p197b68jsn270eb18d8709'
request["X-RapidAPI-Host"] = 'streaming-availability.p.rapidapi.com'

response = http.request(request)
variable = response.read_body
post = JSON.parse(variable)
allfour = post['results']

allfour.each do |four|
  Movie.create(name: four['originalTitle'], description: four['overview'], imdb_rating: four['imdbRating'], image_url: four['posterURLs']['original'], release_date: four['year'], genre: four['genres'][1], video_url: four['streamingInfo']['all4']['gb']['link'], platform: "ALL 4")
end

################# iplayer #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=iplayer&type=#{type}&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'c2c95fa4d1mshbce08ebcc8b6ab0p197b68jsn270eb18d8709'
request["X-RapidAPI-Host"] = 'streaming-availability.p.rapidapi.com'

response = http.request(request)
variable = response.read_body
post = JSON.parse(variable)
iplayer = post['results']

iplayer.each do |bbc|
  Movie.create(name: bbc['originalTitle'], description: bbc['overview'], imdb_rating: bbc['imdbRating'], image_url: bbc['posterURLs']['original'], release_date: bbc['year'], genre: bbc['genres'][1], video_url: bbc['streamingInfo']['iplayer']['gb']['link'], platform: "BBC iPlayer")
end

################# britbox #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=britbox&type=#{type}&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'c2c95fa4d1mshbce08ebcc8b6ab0p197b68jsn270eb18d8709'
request["X-RapidAPI-Host"] = 'streaming-availability.p.rapidapi.com'

response = http.request(request)
variable = response.read_body
post = JSON.parse(variable)
britboxs = post['results']

britboxs.each do |britbox|
  Movie.create(name: britbox['originalTitle'], description: britbox['overview'], imdb_rating: britbox['imdbRating'], image_url: britbox['posterURLs']['original'], release_date: britbox['year'], genre: britbox['genres'][1], video_url: britbox['streamingInfo']['britbox']['gb']['link'], platform: "britbox")
end

################# platforms #################
platforms = ["Netflix", "Amazon Prime", "Disney +", "Apple TV", "NOW TV", "ALL 4", "BBC iPlayer", "britbox"]

platforms.each do |platform|
  Platform.create(name: platform)
end
