module Lita
  module Handlers
    class Stocks < Handler
      route(/stock(?: me)? (.*)/i, :stock, command: true, help: {
        "stock me <symbol>" => "Get current price for <symbol>",
      })

      route(/(?:papa )(pypl|paypal)(?: me)?/i, :pypl, command: true, help: {
        "papa paypal" => "Get current price for PYPL",
        "pypl me" => "Get current price for PYPL",
      })

      def stock(symbol)
        resp = http.get("https://api.iextrading.com/1.0/stock/#{symbol}/quote")
        stock_info = MultiJson.load(resp.body)
        response.reply("#{stock_info['symbol']}: #{stock_info['latestPrice']}")
      end

      def pypl
        resp = http.get("https://api.iextrading.com/1.0/stock/pypl/quote")
        stock_info = MultiJson.load(resp.body)
        response.reply("PYPL: #{stock_info['latestPrice']}")
      end
    end

    Lita.register_handler(Stocks)
  end
end
