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
      # Your code goes here...
      binding.pry
    end
  end
end

int = Commitchamp::Interact.new

binding.pry

# app = Commitchamp::App.new(int)
# app.run
