class Commit < OpenStruct
  attr_reader :service

  def self.service
    @service ||= GithubService.new
  end

  def self.recent(username)
    commits = []
    repo_names = service.repositories(username).map do |repo|
                    repo[:name]
                 end
    repo_commits = repo_names.map do |repo|
      service.commits(username, repo)
    end
    repo_commits.delete_if {|repo| repo.empty? || repo.class == Hash}
    repo_commits.each do |repo|
      repo.each do |commit|
        commits << {date:     commit[:commit][:author][:date],
                  repo_url: commit[:html_url],
                  message:  commit[:commit][:message]}
      end
    end
    commits[0..9]
  end

end
