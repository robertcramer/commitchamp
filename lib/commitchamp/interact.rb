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

      @results= []
      response.map do |response|
        additions = 0
        deletions = 0
        commits = 0
        weeks = response["weeks"]
        weeks.map do |week|
          additions += week["a"]
          deletions += week["d"]
          commits += week["c"]
        end
        @results.push({login: response["author"]["login"], additions: additions, deletions: deletions, commits: commits})
      end
      printf("%-20s %-10s %-10s %-10s\n", "Username ", "Additions ", "Deletions ", "Commits")
      @results.each do |result|
        printf("%-20s %-10s %-10s %-10s\n", "#{result[:login]}", "#{result[:additions]}", "#{result[:deletions]}", "#{result[:commits]}")
      end

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

    def get_names(response)
      names = response.map {|x| x["author"]["login"]}
    end

    def get_info
      #need additions, deletions, and changes for each user...
    end







  end
end