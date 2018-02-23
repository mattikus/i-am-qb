module Lita
  module Handlers
    class Responses < Handler
      # Make sure people know who QB is.
      route(/:rotating_light:|who is qb/i, command: false) do |repsonse|
        response.reply("*I AM QB*")
      end
    end

    Lita.register_handler(Emoji)
  end
end
