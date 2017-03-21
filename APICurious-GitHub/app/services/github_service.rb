class GithubService
  attr_reader :connection, :username, :auth

  def initialize
    @connection = Faraday.new('https://api.github.com')
    @username   = username
    @auth       = "?client_id=#{ENV['GITHUB_KEY']}&client_secret=#{ENV['GITHUB_SECRET']}"
  end

  def repositories(username)
    parse(connection.get("/users/#{username}/repos#{auth}"))
  end

  def followers(username)
    parse(connection.get("/users/#{username}/followers#{auth}"))
  end

  def starred_repositories(username)
    parse(connection.get("/users/#{username}/starred#{auth}"))
  end

  def following(username)
    parse(connection.get("/users/#{username}/following#{auth}"))
  end


  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
