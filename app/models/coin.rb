require_relative '../api_key.rb'

class Coin < ApplicationRecord
  has_many :user_coins
  has_many :users, through: :user_coins

  def self.add_coins(name, symbol, price)
    self.create(name: name, symbol: symbol, price: price) unless self.find_by(symbol: symbol)
  end

  def self.get_price_data_from_API(symbol_buying, symbol_selling)
    response_string = RestClient.get("https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/market-pairs/latest?CMC_PRO_API_KEY=#{API_key}&symbol=#{symbol_selling}&convert=GBP")
    data = response_string["data"]["market_pairs"]
    pairs = data.select{|item| item["market_pair"] == "#{symbol_buying}/#{symbol_selling}"}
    price_array = []
    pairs.each do |pair|
      price_array << pair["quote"]["GBP"]["price"]
    end
    sum = price_array.inject :+
    price_array = price_array.sort
    average = sum / price_array.length
    min = price_array[0]
    max = price_array[price_array.length - 1]
    count = price_array.count
    price_array
  end

  get_price_data_from_API("ETH", "BTC")

end
