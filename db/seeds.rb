# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
Coin.destroy_all
User.destroy_all
Transaction.destroy_all
UserCoin.destroy_all

coin1 = Coin.create!(name: "Bitcoin", symbol: "BTC", price: 0)
coin2 = Coin.create!(name: "Ethereum", symbol: "ETH", price: 0)
coin3 = Coin.create!(name: "Litecoin", symbol: "LTC", price: 0)
coin3 = Coin.create!(name: "XRP", symbol: "XRP", price: 0)
coin3 = Coin.create!(name: "EOS", symbol: "EOS", price: 0)

jack = User.create!(username: "jack123", email: "jack@gmail.com", password: "123", first_name: "Jack", last_name: "Ling", profile_pic_url: "")
holly = User.create!(username: "holly123", email: "holly@gmail.com", password: "123", first_name: "Holly", last_name: "Atkinson", profile_pic_url: "")
guy = User.create!(username: "thatGuy", email: "imthatguyguy@gmail.com", password: "123", first_name: "Guy", last_name: "Bennett-Jones", profile_pic_url: "")
nathan = User.create!(username: "Toast", email: "nathan09@gmail.com", password: "123", first_name: "Nathan", last_name: "Bell", profile_pic_url: "")
janine = User.create!(username: "Ja9", email: "janine@gmail.com", password: "123", first_name: "Janine", last_name: "Luk", profile_pic_url: "")
ian = User.create!(username: "1AN", email: "ian@gmail.com", password: "123", first_name: "Ian", last_name: "Harrison", profile_pic_url: "")
dan = User.create!(username: "DanTheMan", email: "Kaczmarczyk@gmail.com", password: "123", first_name: "Holly", last_name: "Atkinson", profile_pic_url: "")
vasile = User.create!(username: "Vasyl", email: "vasile@gmail.com", password: "123", first_name: "Vasile", last_name: "Cojusco", profile_pic_url: "")

t1 = Transaction.create!(user_one_id: jack.id, user_two_id: holly.id, user_one_amount: 0.5, user_two_amount: 2, user_one_currency_symbol: "BTC", user_two_currency_symbol: "ETH", user_one_price: 2000, user_two_price: 300)
t2 = Transaction.create!(user_one_id: holly.id, user_two_id: jack.id, user_one_amount: 2, user_two_amount: 5, user_one_currency_symbol: "ETH", user_two_currency_symbol: "LTC", user_one_price: 300, user_two_price: 40)

u1 = UserCoin.create!(user: jack, coin: coin1, quantity: 5, selling: false)
u2 = UserCoin.create!(user: jack, coin: coin2, quantity: 10, selling: true)
u3 = UserCoin.create!(user: jack, coin: coin3, quantity: 15, selling: false)
u4 = UserCoin.create!(user: holly, coin: coin1, quantity: 12, selling: true)
u5 = UserCoin.create!(user: holly, coin: coin2, quantity: 20, selling: true)
u6 = UserCoin.create!(user: holly, coin: coin3, quantity: 5, selling: false)
