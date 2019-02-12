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
    price_array
  end

  def self.populate_coins_GBP
    coins_GBP = []

    price_BTC = get_price_data_from_API("BTC", "GBP")
    if price_BTC.length > 0
      sum = price_BTC.inject :+
      average_BTC = sum / price_BTC.length
    end
    coins_GBP << average_BTC

    price_ETH = get_price_data_from_API("ETH", "GBP")
    if price_ETH.length > 0
      sum = price_ETH.inject :+
      average_ETH = sum / price_ETH.length
    end
    coins_GBP << average_ETH

    price_LTC = get_price_data_from_API("LTC", "GBP")
    if price_LTC.length > 0
      sum = price_LTC.inject :+
      average_LTC = sum / price_LTC.length
    end
    coins_GBP << average_LTC

    price_XRP = get_price_data_from_API("XRP", "GBP")
    if price_XRP.length > 0
      sum = price_XRP.inject :+
      average_XRP = sum / price_XRP.length
    end
    coins_GBP << average_XRP

    price_EOS = get_price_data_from_API("EOS", "GBP")
    if price_EOS.length > 0
      sum = price_EOS.inject :+
      average_EOS = sum / price_EOS.length
    end
    coins_GBP << average_EOS

    coins_GBP
  end

  def self.populate_coins_USD
    coins_USD = []

    price_BTC = get_price_data_from_API("BTC", "USD")
    if price_BTC.length > 0
      sum = price_BTC.inject :+
      average_BTC = sum / price_BTC.length
    end
    coins_USD << average_BTC

    price_ETH = get_price_data_from_API("ETH", "USD")
    if price_ETH.length > 0
      sum = price_ETH.inject :+
      average_ETH = sum / price_ETH.length
    end
    coins_USD << average_ETH

    price_LTC = get_price_data_from_API("LTC", "USD")
    if price_LTC.length > 0
      sum = price_LTC.inject :+
      average_LTC = sum / price_LTC.length
    end
    coins_USD << average_LTC

    price_XRP = get_price_data_from_API("XRP", "USD")
    if price_XRP.length > 0
      sum = price_XRP.inject :+
      average_XRP = sum / price_XRP.length
    end
    coins_USD << average_XRP

    price_EOS = get_price_data_from_API("EOS", "USD")
    if price_EOS.length > 0
      sum = price_EOS.inject :+
      average_EOS = sum / price_EOS.length
    end
    coins_USD << average_EOS

    coins_USD
  end

  def self.populate_coins_BTC
    coins = []

    price_ETH = get_price_data_from_API("ETH", "BTC")
    if price_ETH.length > 0
      sum = price_ETH.inject :+
      average_ETH = sum / price_ETH.length
    end
    coins << average_ETH

    price_LTC = get_price_data_from_API("LTC", "BTC")
    if price_LTC.length > 0
      sum = price_LTC.inject :+
      average_LTC = sum / price_LTC.length
    end
    coins << average_LTC

    price_XRP = get_price_data_from_API("XRP", "BTC")
    if price_XRP.length > 0
      sum = price_XRP.inject :+
      average_XRP = sum / price_XRP.length
    end
    coins << average_XRP

    price_EOS = get_price_data_from_API("EOS", "BTC")
    if price_EOS.length > 0
      sum = price_EOS.inject :+
      average_EOS = sum / price_EOS.length
    end
    coins << average_EOS

    coins
  end

  def self.populate_coins_ETH
    coins = []

    price_ETH = get_price_data_from_API("BTC", "ETH")
    if price_ETH.length > 0
      sum = price_ETH.inject :+
      average_ETH = sum / price_ETH.length
    end
    coins << average_ETH

    price_LTC = get_price_data_from_API("LTC", "ETH")
    if price_LTC.length > 0
      sum = price_LTC.inject :+
      average_LTC = sum / price_LTC.length
    end
    coins << average_LTC

    price_XRP = get_price_data_from_API("XRP", "ETH")
    if price_XRP.length > 0
      sum = price_XRP.inject :+
      average_XRP = sum / price_XRP.length
    end
    coins << average_XRP

    price_EOS = get_price_data_from_API("EOS", "ETH")
    if price_EOS.length > 0
      sum = price_EOS.inject :+
      average_EOS = sum / price_EOS.length
    end
    coins << average_EOS

    coins
  end


end
