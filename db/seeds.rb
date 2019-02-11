# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
coin1 = Coin.create(name: "Bitcoin", symbol: "BTC", price: 10000)
coin2 = Coin.create(name: "Ethereum", symbol: "ETH", price: 150)
coin3 = Coin.create(name: "Litecoin", symbol: "LTC", price: 50)
jack = User.create(username: "jack123", email: "jack@gmail.com", password_digest: "123", first_name: "Jack", last_name: "Ling", profile_pic_url: "")
holly = User.create(username: "holly123", email: "holly@gmail.com", password_digest: "123", first_name: "Holly", last_name: "Atkinson", profile_pic_url: "")
t1 = Transaction.create(user_one_id: 1, user_two_id: 2, user_one_amount: 0.5, user_two_amount: 2, user_one_currency_symbol: "BTC", user_two_currency_symbol: "ETH")
t2 = Transaction.create(user_one_id: 2, user_two_id: 1, user_one_amount: 2, user_two_amount: 5, user_one_currency_symbol: "ETH", user_two_currency_symbol: "LTC")
u1 = UserCoin.create(user_id: 1, coin_id: 1, quantity: 5, selling: false)
u2 = UserCoin.create(user_id: 1, coin_id: 2, quantity: 10, selling: true)
u3 = UserCoin.create(user_id: 1, coin_id: 3, quantity: 15, selling: false)
u4 = UserCoin.create(user_id: 2, coin_id: 1, quantity: 12, selling: true)
u5 = UserCoin.create(user_id: 2, coin_id: 2, quantity: 20, selling: true)
u6 = UserCoin.create(user_id: 2, coin_id: 3, quantity: 5, selling: false)
