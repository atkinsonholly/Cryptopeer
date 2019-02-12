 require_relative '../api_key.rb'

class Coin < ApplicationRecord
  has_many :user_coins
  has_many :users, through: :user_coins

  def self.add_coins(name, symbol, price)
    self.create(name: name, symbol: symbol, price: price) unless self.find_by(symbol: symbol)
  end

  def self.get_price_data_from_API(symbol_selling, symbol_buying)
    response_string = RestClient.get("https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/market-pairs/latest?CMC_PRO_API_KEY=#{API_key}&symbol=#{symbol_selling}&convert=GBP")
    data = JSON.parse(response_string)
    data = data["data"]["market_pairs"]
    pairs = data.select{|item| item["market_pair"] == "#{symbol_selling}/#{symbol_buying}"}
    price_array = []
    pairs.each do |pair|
      if pair["quote"]["GBP"]["price"] != -1
        price_array << pair["quote"]["GBP"]["price"]
      end
    end

    if price_array.length > 0
      sum = price_array.inject :+
      price_array = price_array.sort
      average = sum / price_array.length
      min = price_array[0]
      max = price_array[price_array.length - 1]
      count = price_array.count
    end
    price_array
  end

end
