# Description:
#   A plugin to give you fun blueisms upon request

BLUEISMS = {
  gelman: [
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
  ],

  don: [
    "What if we just <insert idea that has no thought for why $FOO is currently the way it is>",
    "REALLYYYYYYY?",
    "I HATE PROVOLONE",
  ],

  # There are none I'm perfect - Matt
  # Eyeroll - Katy
  mattikus: [
    "I am Matt! Meh meh meh meh meh.",
    "jar!",
  ],
}

module Lita
  module Handlers
    class Blueisms < Handler
      route(/(blue|gelman|don|mattikus)(?: me)?$/i, :random_saying, command: true, help: {
        "gelman me" => "Is it though?",
        "don me" => "Hi I'm Don and my voice GOES LOUD NOW",
        "mattikus me" => "Funny mattikus sayings",
        "blue me" => "Shit Blue Says",
      })

      def random_saying(response)
        who = if response.match_data[1] == "blue" then
                BLUEISMS.keys.shuffle.first
              else
                response.match_data[1].to_sym
              end
        response.reply(%Q["#{BLUEISMS[who].shuffle.first}" -- @#{who}])
      end
    end

    Lita.register_handler(Blueisms)
  end
end
