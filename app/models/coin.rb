 require_relative '../api_key.rb'

class Coin < ApplicationRecord
  has_many :user_coins
  has_many :users, through: :user_coins

  def self.add_coins(name, symbol, price)
    self.create(name: name, symbol: symbol, price: price) unless self.find_by(symbol: symbol)
  end

  # The below section contains methods that request price data from Coinmarketcap API.
  # Price information for each coin is the mean of available data.
  # Price information is provided as a guide only; any information shown on the Cryptopeer website should not be construed as advice.
  # The information is not, and should not be read as, a recommendation to buy or sell any cryptocurrency.
  # You are solely responsible for your own investment research, decisions and results.

  def self.get_price_data_from_API(symbol_selling, symbol_buying, currency)
    # Development API: sandbox-api.coinmarketcap.com
    response_string = RestClient.get("https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/market-pairs/latest?CMC_PRO_API_KEY=#{API_key}&symbol=#{symbol_selling}&convert=#{currency}")
    data = JSON.parse(response_string)
    data = data["data"]["market_pairs"]
    pairs = data.select{|item| item["market_pair"] == "#{symbol_selling}/#{symbol_buying}"}
    price_array = []
    pairs.each do |pair|
      if pair["quote"][currency]["price"] != -1
        price_array << pair["quote"][currency]["price"]
      end
    end
    price_array
  end

  def self.average_array(arr)
    if arr.length > 0
      sum = arr.inject :+
      average_price = sum / arr.length
    end
    average_price
  end

  def self.populate_coins(currency) # use currency symbol string eg "USD"
    Coin.destroy_all
    coins_arr = []
    coin_symbols = ["BTC", "ETH", "LTC", "XRP", "EOS"]
    # Get API data for each coin_symbol in given currency
    coin_symbols.each do |symbol|
      price = self.get_price_data_from_API(symbol, currency, currency)
      coins_arr << self.average_array(price)
    end
    # Create coin objects for each coin_symbol
    self.add_coins("Bitcoin", "BTC", coins_arr[0])
    self.add_coins("Ethereum", "ETH", coins_arr[1])
    self.add_coins("Litecoin", "LTC", coins_arr[2])
    self.add_coins("XRP", "XRP", coins_arr[3])
    self.add_coins("EOS", "EOS", coins_arr[4])
    # Return the array of prices
    coins_arr
  end

  def self.find_coin(symbol)
    coin = Coin.find_by symbol: symbol
  end

  def self.update_coins(currency) # use currency symbol string eg "USD"
    coin_symbols = ["BTC", "ETH", "LTC", "XRP", "EOS"]
    # Get API data for each coin_symbol in given currency
    coin_symbols.map do |symbol|
      price = self.get_price_data_from_API(symbol, currency, currency)
      coin_price = self.average_array(price)
      coin = self.find_coin(symbol)
      # Update just the price attribute for each existing Coin
      coin.update(:price => coin_price)
    end
  end

end
