# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'net/http'
require 'openssl'
require 'json'

################# platforms #################

platforms = ["Netflix", "Amazon Prime", "Disney +", "Apple TV", "NOW TV", "ALL 4", "BBC iPlayer", "britbox"]
Platform.destroy_all

netflix_platform = Platform.new(name: "Netflix")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670410458/netflix-logo_xibfku.png")
netflix_platform.photo.attach(io: file, filename: "netflix-logo_xibfku.png", content_type: "image/png")
netflix_platform.save


amazonprime_platform = Platform.new(name: "Amazon Prime")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670410902/RFeVpNYj_400x400_jen7b1.jpg")
amazonprime_platform.photo.attach(io: file, filename: "RFeVpNYj_400x400_jen7b1", content_type: "image/jpg")
amazonprime_platform.save

disney_platform = Platform.new(name: "Disney +")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670410955/f2d3dbee26e933ee8a40c6d3d01cb2d9_hgudl5.jpg")
disney_platform.photo.attach(io: file, filename: "f2d3dbee26e933ee8a40c6d3d01cb2d9_hgudl5.jpg", content_type: "image/jpg")
disney_platform.save

appletv_platform = Platform.new(name: "Apple TV")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670410978/zovfDsfyegE7SF3hCrN_hWPiQ2VLSh_Hreg20YsgQD5d9rfeq_HLA1fdq3q9zn-QNg_f9vlte.png")
appletv_platform.photo.attach(io: file, filename: "zovfDsfyegE7SF3hCrN_hWPiQ2VLSh_Hreg20YsgQD5d9rfeq_HLA1fdq3q9zn-QNg_f9vlte.png", content_type: "image/png")
appletv_platform.save

nowtv_platform = Platform.new(name: "NOW TV")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670411007/NOW_Logo_Broadband_and_TV_2021_nn6mgl.jpg")
nowtv_platform.photo.attach(io: file, filename: "NOW_Logo_Broadband_and_TV_2021_nn6mgl.jpg", content_type: "image/jpg")
nowtv_platform.save

all4_platform = Platform.new(name: "ALL 4")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670496130/All4-SAMLL_lqxu9g.jpg")
all4_platform.photo.attach(io: file, filename: "1024px-Channel_4_logo_1999.svg_sqikdd.png", content_type: "image/png")
all4_platform.save

bbciplayer_platform = Platform.new(name: "BBC iPlayer")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670411071/BBC-iPlayer-Logo_nzoaxi.png")
bbciplayer_platform.photo.attach(io: file, filename: "BBC-iPlayer-Logo_nzoaxi", content_type: "image/png")
bbciplayer_platform.save

britbox_platform = Platform.new(name: "britbox")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670411103/britbox_black_tvfpte.png")
britbox_platform.photo.attach(io: file, filename: "britbox_black_tvfpte", content_type: "image/png")
britbox_platform.save

################# NETFLIX #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=netflix&type=movie&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: netflix['originalTitle'], description: netflix['overview'], imdb_rating: netflix['imdbRating'], image_url: netflix['posterURLs']['original'],banner_url: netflix['backdropURLs']['original'], release_date: netflix['year'], genre: netflix['genres'][1], video_url: netflix['streamingInfo']['netflix']['gb']['link'], platform: "Netflix")
  MoviePlatform.create!(platform: netflix_platform, movie: Movie.last)
end

################# AMAZON #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=prime&type=movie&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: prime['originalTitle'], description: prime['overview'], imdb_rating: prime['imdbRating'], image_url: prime['posterURLs']['original'],banner_url: prime['backdropURLs']['original'], release_date: prime['year'], genre: prime['genres'][1], video_url: prime['streamingInfo']['prime']['gb']['link'], platform: "Amazon Prime")
  MoviePlatform.create!(platform: amazonprime_platform, movie: Movie.last)
end

################# DISNEY #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=disney&type=movie&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: disney['originalTitle'], description: disney['overview'], imdb_rating: disney['imdbRating'], image_url: disney['posterURLs']['original'],banner_url: disney['backdropURLs']['original'],release_date: disney['year'], genre: disney['genres'][1], video_url: disney['streamingInfo']['disney']['gb']['link'], platform: "Disney +")
  MoviePlatform.create!(platform: disney_platform, movie: Movie.last)
end

################# APPLE #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=apple&type=movie&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: apple['originalTitle'], description: apple['overview'], imdb_rating: apple['imdbRating'], image_url: apple['posterURLs']['original'],banner_url: apple['backdropURLs']['original'], release_date: apple['year'], genre: apple['genres'][1], video_url: apple['streamingInfo']['apple']['gb']['link'], platform: "Apple TV")
  MoviePlatform.create!(platform: appletv_platform, movie: Movie.last)
end

################# NOW #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=now&type=movie&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: now['originalTitle'], description: now['overview'], imdb_rating: now['imdbRating'], image_url: now['posterURLs']['original'],banner_url: now['backdropURLs']['original'], release_date: now['year'], genre: now['genres'][1], video_url: now['streamingInfo']['now']['gb']['link'], platform: "NOW TV")
  MoviePlatform.create!(platform: nowtv_platform, movie: Movie.last)
end

################# ALL 4 #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=all4&type=movie&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: four['originalTitle'], description: four['overview'], imdb_rating: four['imdbRating'], image_url: four['posterURLs']['original'],banner_url: four['backdropURLs']['original'], release_date: four['year'], genre: four['genres'][1], video_url: four['streamingInfo']['all4']['gb']['link'], platform: "ALL 4")
  MoviePlatform.create!(platform: all4_platform, movie: Movie.last)
end

################# iplayer #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=iplayer&type=movie&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: bbc['originalTitle'], description: bbc['overview'], imdb_rating: bbc['imdbRating'], image_url: bbc['posterURLs']['original'],banner_url: bbc['backdropURLs']['original'], release_date: bbc['year'], genre: bbc['genres'][1], video_url: bbc['streamingInfo']['iplayer']['gb']['link'], platform: "BBC iPlayer")
  MoviePlatform.create!(platform: bbciplayer_platform, movie: Movie.last)
end

################# britbox #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=britbox&type=movie&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: britbox['originalTitle'], description: britbox['overview'], imdb_rating: britbox['imdbRating'], image_url: britbox['posterURLs']['original'],banner_url: britbox['backdropURLs']['original'], release_date: britbox['year'], genre: britbox['genres'][1], video_url: britbox['streamingInfo']['britbox']['gb']['link'], platform: "britbox")
  MoviePlatform.create!(platform: britbox_platform, movie: Movie.last)
end

################# NETFLIX #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=netflix&type=series&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: netflix['originalTitle'], description: netflix['overview'], imdb_rating: netflix['imdbRating'], image_url: netflix['posterURLs']['original'], banner_url: netflix['backdropURLs']['original'],release_date: netflix['year'], genre: netflix['genres'][1], video_url: netflix['streamingInfo']['netflix']['gb']['link'], platform: "Netflix")
  MoviePlatform.create!(platform: netflix_platform, movie: Movie.last)
end

################# AMAZON #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=prime&type=series&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: prime['originalTitle'], description: prime['overview'], imdb_rating: prime['imdbRating'], image_url: prime['posterURLs']['original'],banner_url: prime['backdropURLs']['original'], release_date: prime['year'], genre: prime['genres'][1], video_url: prime['streamingInfo']['prime']['gb']['link'], platform: "Amazon Prime")
  MoviePlatform.create!(platform: amazonprime_platform, movie: Movie.last)
end

################# DISNEY #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=disney&type=series&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: disney['originalTitle'], description: disney['overview'], imdb_rating: disney['imdbRating'], image_url: disney['posterURLs']['original'],banner_url: disney['backdropURLs']['original'], release_date: disney['year'], genre: disney['genres'][1], video_url: disney['streamingInfo']['disney']['gb']['link'], platform: "Disney +")
  MoviePlatform.create!(platform: disney_platform, movie: Movie.last)
end

################# APPLE #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=apple&type=series&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: apple['originalTitle'], description: apple['overview'], imdb_rating: apple['imdbRating'], image_url: apple['posterURLs']['original'],banner_url: apple['backdropURLs']['original'], release_date: apple['year'], genre: apple['genres'][1], video_url: apple['streamingInfo']['apple']['gb']['link'], platform: "Apple TV")
  MoviePlatform.create!(platform: appletv_platform, movie: Movie.last)
end

################# NOW #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=now&type=series&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: now['originalTitle'], description: now['overview'], imdb_rating: now['imdbRating'], image_url: now['posterURLs']['original'],banner_url: now['backdropURLs']['original'], release_date: now['year'], genre: now['genres'][1], video_url: now['streamingInfo']['now']['gb']['link'], platform: "NOW TV")
  MoviePlatform.create!(platform: nowtv_platform, movie: Movie.last)
end

################# ALL 4 #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=all4&type=series&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: four['originalTitle'], description: four['overview'], imdb_rating: four['imdbRating'], image_url: four['posterURLs']['original'],banner_url: four['backdropURLs']['original'], release_date: four['year'], genre: four['genres'][1], video_url: four['streamingInfo']['all4']['gb']['link'], platform: "ALL 4")
  MoviePlatform.create!(platform: all4_platform, movie: Movie.last)
end

################# iplayer #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=iplayer&type=series&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: bbc['originalTitle'], description: bbc['overview'], imdb_rating: bbc['imdbRating'], image_url: bbc['posterURLs']['original'],banner_url: bbc['backdropURLs']['original'], release_date: bbc['year'], genre: bbc['genres'][1], video_url: bbc['streamingInfo']['iplayer']['gb']['link'], platform: "BBC iPlayer")
  MoviePlatform.create!(platform: bbciplayer_platform, movie: Movie.last)
end

################# britbox #################

url = URI("https://streaming-availability.p.rapidapi.com/search/pro?country=gb&service=britbox&type=series&order_by=original_title&desc=true&language=en&output_language=en")

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
  Movie.create!(name: britbox['originalTitle'], description: britbox['overview'], imdb_rating: britbox['imdbRating'], image_url: britbox['posterURLs']['original'],banner_url: britbox['backdropURLs']['original'], release_date: britbox['year'], genre: britbox['genres'][1], video_url: britbox['streamingInfo']['britbox']['gb']['link'], platform: "britbox")
  MoviePlatform.create!(platform: britbox_platform, movie: Movie.last)
end
