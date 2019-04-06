# Load all custom private modules
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |file| require file }

Lita.configure do |config|
  config.robot.name = "qb"

  config.robot.log_level = :info

  config.redis[:host] = "localhost"

  config.robot.adapter = :slack
  config.robot.admins = [
  ]
  config.adapters.slack.token = ENV['LITA_SLACK_TOKEN']
  config.adapters.slack.link_names = true
  config.adapters.slack.parse = "full"
  config.adapters.slack.unfurl_links = true
  config.adapters.slack.unfurl_media = true

  config.handlers.deploy.development_room = "#qb-devel"
end
