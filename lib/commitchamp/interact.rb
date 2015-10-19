module Commitchamp
  class Interact
    include HTTParty
    base_uri "https://api.github.com"

    def initialize
      @auth = {
          "Authorization" => "token #{get_token}",
          "User-Agent"    => "HTTParty"
      }
    end

    def get_contributions
      response = Interact.get("/repos/#{get_owner}/#{get_repo}/stats/contributors",
                   :headers => @auth)
      binding.pry
    end

    def get_token
      puts "Please enter your authentication token:"
      gets.chomp
    end

    def get_owner
      puts "Please enter the owner: "
      gets.chomp
    end

    def get_repo
      puts "Please enter the repo: "
      gets.chomp
    end

    def show_contributers
      print "Username       Additions      Deletions      Changes

           "
    end


  end
end