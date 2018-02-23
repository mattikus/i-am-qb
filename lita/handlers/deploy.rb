module Lita
  module Handlers
    class Deploy < Lita::Extensions::GitHubWebHooksCore::HookReceiver
      config :development_room

      def self.name
        "Deploy"
      end

      def devel_room
        Source.new(room: config.development_room)
      end

      on(:connected) do
        robot.send_message(devel_room, "I LIVE!!!")
      end

      http.post "/github-web-hooks", :receive_hook

      def logger
        Lita.logger
      end

      # If we get a push event, kill server so it can be restarted by the
      # service manager
      on(:push) do |payload|
        if payload["ref"] =~ /master/
          logger.info("Received push event, commiting suicide!")
          robot.send_message(devel_room, "Deploying sha: `#{payload["after"]}`")
          exit!
        end
      end

      Lita.register_handler(Deploy)
    end
  end
end

