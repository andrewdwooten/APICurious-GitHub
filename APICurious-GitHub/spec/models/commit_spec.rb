require 'rails_helper'

describe Commit do
  describe '#recent' do
    it "returns 10 most recent commits" do
      commits = Commit.recent('andrewdwooten')
      commit  = commits.first

      expect(commits.count).to eq(10)
      expect(commit.has_key?(:date)).to eq(true)
      expect(commit.has_key?(:repo_url)).to eq(true)
      expect(commit.has_key?(:message)).to eq(true)
    end
  end
end
