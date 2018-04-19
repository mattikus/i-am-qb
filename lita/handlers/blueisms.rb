# Description:
#   A plugin to give you fun blueisms upon request

GELMANISMS = [
  "It's called...pairing.",
  "What could go wrong?",
  "The thing is...",
  "Counterargument!",
  "I'd like to point out...",
  "You're not wrong",
  "This is a flaming pile of garbage",
  "Yeah that definitely won't screw us over...",
  "Have you considered that you're just wrong?",
  "NO YOU'RE THE PUPPET!",
  "In all fairness...",
  "To be fair...",
  "When I talk people listen...",
  "I'm not NOT ${FOO}ing",
  "No that sounds wrong.",
  "<Insert Arrested Development Joke Here>",
  "<Blah> and I can't emphasize this enough <blah blah>",
  "Did you know you can get lunch for free by staying in the office?!",
  "It does seem like something that will subtley screw us",
]

DONISMS = [
  "What if we just <insert idea that has no thought for why $FOO is currently the way it is>",
  "REALLYYYYYYY?",
  "I HATE PROVOLONE",
]

# There are none I'm perfect - Matt
# Eyeroll - Katy
MATTIKUSISMS = [
  "I am Matt! Meh meh meh meh meh.",
  "jar!",
],

module Lita
  module Handlers
    class Blueisms < Handler
      route(/gelman( me)?$/i, command: true, help: { "gelman me" => "Shit Gelman Says", }) do |response|
        response.reply(":#{random(GELMANISMS)}:")
      end

      route(/don( me)?$/i, command: true, help: { "don me" => "Hi I'm Don and my voice GOES LOUD NOW", }) do |response|
        response.reply(":#{random(DONISMS)}:")
      end

      route(/mattikus( me)?$/i, command: true, help: { "mattikus me" => "Funny mattikus sayings", }) do |response|
        response.reply(":#{random(MATTIKUSISMS)}:")
      end

      def random(items)
        items.shuffle.first
      end
    end

    Lita.register_handler(Blueisms)
  end
end
