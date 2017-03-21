class Repository < OpenStruct
  attr_reader :service

  def self.service
    @service ||= GithubService.new
  end

  def self.count_of_starred(username)
    service.starred_repositories(username).count
  end

end
