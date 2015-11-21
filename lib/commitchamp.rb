require "httparty"
require "pry"

require "commitchamp/version"
require "commitchamp/interact"
# Probably you also want to add a class for talking to github.

module Commitchamp
  class App
    def initialize
      @interact = Interact.new
    end


    def run
      @interact.get_contributions

    end
  end
end




app = Commitchamp::App.new
app.run
