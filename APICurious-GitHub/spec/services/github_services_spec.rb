require 'rails_helper'

describe GithubService do
  attr_reader :service

  before(:each) do
    @service = GithubService.new
  end

  describe '#repositories' do
  it 'finds all user repositories' do
    VCR.use_cassette('services/repositories') do
      repositories = @service.repositories('andrewdwooten')
      repository = repositories.first

      expect(repositories.count).to eq(28)
      expect(repository[:name]).to eq("advanced_enumerables")
    end
  end
end

  describe '#followers' do
    it 'finds all users followers' do
      VCR.use_cassette('services/followers') do
        followers = @service.followers('andrewdwooten')
        follower = followers.first

        expect(followers.count).to eq(1)
        expect(follower[:login]).to eq('CjMoore')
      end
    end
  end

  describe '#starred' do
    it 'finds the starred repos of a user' do
      VCR.use_cassette('services/starred_repos') do
        starred = @service.starred_repositories('andrewdwooten')
        star = starred.first

        expect(starred.count).to eq(1)
        expect(star[:name]).to eq('portfolios')
      end
    end
  end

  describe '#following' do
    it 'finds users the current user is following' do
      VCR.use_cassette('services/following') do
        following = @service.following('andrewdwooten')
        followed = following.first

        expect(following.count).to eq(1)
        expect(followed[:login]).to eq('blackknight75')
      end
    end
  end

  describe '#commits_to_repo' do
    it 'finds users the users commits to a repository' do
      VCR.use_cassette('services/commits') do
        commits = @service.commits_to_repo('andrewdwooten', 'advanced_enumerables')
        commit = commits.first

        expect(commits.count).to eq(2)
        expect(commit[:commit][:author][:name]).to eq('Andy Wooten')
        expect(commit[:commit][:message]).to eq('Committing all files')
      end
    end
  end
end
