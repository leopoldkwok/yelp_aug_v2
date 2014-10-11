# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

kfc = Restaurant.create(:name => "KFC")

kfc.reviews.create(rating: 1, thoughts: "bad")
kfc.reviews.create(rating: 2, thoughts: "ok")
kfc.reviews.create(rating: 3, thoughts: "so so")
kfc.reviews.create(rating: 4, thoughts: "good")
kfc.reviews.create(rating: 5, thoughts: "fantastic")

nandos = Restaurant.create(:name => "Nandos")
nandos.reviews.create(rating: 1, thoughts: "really bad")
nandos.reviews.create(rating: 2, thoughts: "really ok")
nandos.reviews.create(rating: 3, thoughts: "really so so")
nandos.reviews.create(rating: 4, thoughts: "really good")
nandos.reviews.create(rating: 5, thoughts: "really fantastic")

wasabi = Restaurant.create(:name => "Wasabi")
wasabi.reviews.create(rating: 1, thoughts: "really bad")
wasabi.reviews.create(rating: 2, thoughts: "really ok")
wasabi.reviews.create(rating: 3, thoughts: "really so so")
wasabi.reviews.create(rating: 4, thoughts: "really good")
wasabi.reviews.create(rating: 5, thoughts: "really fantastic") 