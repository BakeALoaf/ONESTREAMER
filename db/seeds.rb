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

################# NETFLIX #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=netflix&type=movie&output_language=en&language=en")

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
  Movie.create!(name: netflix['originalTitle'], description: netflix['overview'], imdb_rating: netflix['imdbRating'], image_url: netflix['posterURLs']['original'], release_date: netflix['year'], genre: netflix['genres'][1], video_url: netflix['streamingInfo']['netflix']['gb']['link'], platform: "Netflix")
end

################# AMAZON #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=prime&type=movie&output_language=en&language=en")

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
  Movie.create!(name: prime['originalTitle'], description: prime['overview'], imdb_rating: prime['imdbRating'], image_url: prime['posterURLs']['original'], release_date: prime['year'], genre: prime['genres'][1], video_url: prime['streamingInfo']['prime']['gb']['link'], platform: "Amazon Prime")
end

################# DISNEY #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=disney&type=movie&output_language=en&language=en")

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
  Movie.create!(name: disney['originalTitle'], description: disney['overview'], imdb_rating: disney['imdbRating'], image_url: disney['posterURLs']['original'], release_date: disney['year'], genre: disney['genres'][1], video_url: disney['streamingInfo']['disney']['gb']['link'], platform: "Disney +")
end

################# APPLE #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=apple&type=movie&output_language=en&language=en")

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
  Movie.create!(name: apple['originalTitle'], description: apple['overview'], imdb_rating: apple['imdbRating'], image_url: apple['posterURLs']['original'], release_date: apple['year'], genre: apple['genres'][1], video_url: apple['streamingInfo']['apple']['gb']['link'], platform: "Apple TV")
end

################# NOW #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=now&type=movie&output_language=en&language=en")

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
  Movie.create!(name: now['originalTitle'], description: now['overview'], imdb_rating: now['imdbRating'], image_url: now['posterURLs']['original'], release_date: now['year'], genre: now['genres'][1], video_url: now['streamingInfo']['now']['gb']['link'], platform: "NOW TV")
end

################# ALL 4 #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=all4&type=movie&output_language=en&language=en")

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
  Movie.create!(name: four['originalTitle'], description: four['overview'], imdb_rating: four['imdbRating'], image_url: four['posterURLs']['original'], release_date: four['year'], genre: four['genres'][1], video_url: four['streamingInfo']['all4']['gb']['link'], platform: "ALL 4")
end

################# iplayer #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=iplayer&type=movie&output_language=en&language=en")

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
  Movie.create!(name: bbc['originalTitle'], description: bbc['overview'], imdb_rating: bbc['imdbRating'], image_url: bbc['posterURLs']['original'], release_date: bbc['year'], genre: bbc['genres'][1], video_url: bbc['streamingInfo']['iplayer']['gb']['link'], platform: "BBC iPlayer")
end

################# britbox #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=britbox&type=movie&output_language=en&language=en")

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
  Movie.create!(name: britbox['originalTitle'], description: britbox['overview'], imdb_rating: britbox['imdbRating'], image_url: britbox['posterURLs']['original'], release_date: britbox['year'], genre: britbox['genres'][1], video_url: britbox['streamingInfo']['britbox']['gb']['link'], platform: "britbox")
end

################# NETFLIX #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=netflix&type=series&output_language=en&language=en")

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
  Movie.create!(name: netflix['originalTitle'], description: netflix['overview'], imdb_rating: netflix['imdbRating'], image_url: netflix['posterURLs']['original'], release_date: netflix['year'], genre: netflix['genres'][1], video_url: netflix['streamingInfo']['netflix']['gb']['link'], platform: "Netflix")
end

################# AMAZON #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=prime&type=series&output_language=en&language=en")

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
  Movie.create!(name: prime['originalTitle'], description: prime['overview'], imdb_rating: prime['imdbRating'], image_url: prime['posterURLs']['original'], release_date: prime['year'], genre: prime['genres'][1], video_url: prime['streamingInfo']['prime']['gb']['link'], platform: "Amazon Prime")
end

################# DISNEY #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=disney&type=series&output_language=en&language=en")

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
  Movie.create!(name: disney['originalTitle'], description: disney['overview'], imdb_rating: disney['imdbRating'], image_url: disney['posterURLs']['original'], release_date: disney['year'], genre: disney['genres'][1], video_url: disney['streamingInfo']['disney']['gb']['link'], platform: "Disney +")
end

################# APPLE #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=apple&type=series&output_language=en&language=en")

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
  Movie.create!(name: apple['originalTitle'], description: apple['overview'], imdb_rating: apple['imdbRating'], image_url: apple['posterURLs']['original'], release_date: apple['year'], genre: apple['genres'][1], video_url: apple['streamingInfo']['apple']['gb']['link'], platform: "Apple TV")
end

################# NOW #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=now&type=series&output_language=en&language=en")

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
  Movie.create!(name: now['originalTitle'], description: now['overview'], imdb_rating: now['imdbRating'], image_url: now['posterURLs']['original'], release_date: now['year'], genre: now['genres'][1], video_url: now['streamingInfo']['now']['gb']['link'], platform: "NOW TV")
end

################# ALL 4 #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=all4&type=series&output_language=en&language=en")

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
  Movie.create!(name: four['originalTitle'], description: four['overview'], imdb_rating: four['imdbRating'], image_url: four['posterURLs']['original'], release_date: four['year'], genre: four['genres'][1], video_url: four['streamingInfo']['all4']['gb']['link'], platform: "ALL 4")
end

################# iplayer #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=iplayer&type=series&output_language=en&language=en")

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
  Movie.create!(name: bbc['originalTitle'], description: bbc['overview'], imdb_rating: bbc['imdbRating'], image_url: bbc['posterURLs']['original'], release_date: bbc['year'], genre: bbc['genres'][1], video_url: bbc['streamingInfo']['iplayer']['gb']['link'], platform: "BBC iPlayer")
end

################# britbox #################

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=gb&service=britbox&type=series&output_language=en&language=en")

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
  Movie.create!(name: britbox['originalTitle'], description: britbox['overview'], imdb_rating: britbox['imdbRating'], image_url: britbox['posterURLs']['original'], release_date: britbox['year'], genre: britbox['genres'][1], video_url: britbox['streamingInfo']['britbox']['gb']['link'], platform: "britbox")
end

################# platforms #################
platforms = ["Netflix", "Amazon Prime", "Disney +", "Apple TV", "NOW TV", "ALL 4", "BBC iPlayer", "britbox"]
Platform.destroy_all

netflix = Platform.new(name: "Netflix")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670410458/netflix-logo_xibfku.png")
netflix.photo.attach(io: file, filename: "netflix-logo_xibfku.png", content_type: "image/png")
netflix.save

amazonprime = Platform.new(name: "Amazon Prime")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670410902/RFeVpNYj_400x400_jen7b1.jpg")
amazonprime.photo.attach(io: file, filename: "RFeVpNYj_400x400_jen7b1", content_type: "image/jpg")
amazonprime.save

disney = Platform.new(name: "Disney +")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670410955/f2d3dbee26e933ee8a40c6d3d01cb2d9_hgudl5.jpg")
disney.photo.attach(io: file, filename: "f2d3dbee26e933ee8a40c6d3d01cb2d9_hgudl5.jpg", content_type: "image/jpg")
disney.save



appletv = Platform.new(name: "Apple TV")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670410978/zovfDsfyegE7SF3hCrN_hWPiQ2VLSh_Hreg20YsgQD5d9rfeq_HLA1fdq3q9zn-QNg_f9vlte.png")
appletv.photo.attach(io: file, filename: "zovfDsfyegE7SF3hCrN_hWPiQ2VLSh_Hreg20YsgQD5d9rfeq_HLA1fdq3q9zn-QNg_f9vlte.png", content_type: "image/png")
appletv.save

nowtv = Platform.new(name: "NOW TV")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670411007/NOW_Logo_Broadband_and_TV_2021_nn6mgl.jpg")
nowtv.photo.attach(io: file, filename: "NOW_Logo_Broadband_and_TV_2021_nn6mgl.jpg", content_type: "image/jpg")
nowtv.save

all4 = Platform.new(name: "ALL 4")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670411033/1024px-Channel_4_logo_1999.svg_sqikdd.png")
all4.photo.attach(io: file, filename: "1024px-Channel_4_logo_1999.svg_sqikdd.png", content_type: "image/png")
all4.save

bbciplayer = Platform.new(name: "BBC iPlayer")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670411071/BBC-iPlayer-Logo_nzoaxi.png")
bbciplayer.photo.attach(io: file, filename: "BBC-iPlayer-Logo_nzoaxi", content_type: "image/png")
bbciplayer.save

britbox = Platform.new(name: "britbox")
file = URI.open("https://res.cloudinary.com/dllghzftv/image/upload/v1670411103/britbox_black_tvfpte.png")
britbox.photo.attach(io: file, filename: "britbox_black_tvfpte", content_type: "image/png")
britbox.save
