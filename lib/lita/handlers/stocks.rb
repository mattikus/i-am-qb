module Lita
  module Handlers
    class Stocks < Handler
      route(/^stock(?: me)? ([\w .-_]+)$/i, :stock, command: true, help: {
        "stock me <symbol>" => "Get current price for <symbol>",
      })

      route(/^(papa paypal|pypl me)?$/i, :pypl, command: true, help: {
        "papa paypal" => "Get current price for PYPL",
        "pypl me" => "Get current price for PYPL",
      })

      def stock(response)
        symbol = response.match_data[1]
        resp = http.get("https://api.iextrading.com/1.0/stock/#{symbol}/quote")
        stock_info = MultiJson.load(resp.body)
        response.reply("#{stock_info['symbol']}: #{stock_info['latestPrice']}")
      end

      def pypl(response)
        resp = http.get("https://api.iextrading.com/1.0/stock/pypl/quote")
        stock_info = MultiJson.load(resp.body)
        response.reply("PYPL: #{stock_info['latestPrice']}")
      end
    end

    Lita.register_handler(Stocks)
  end
end
