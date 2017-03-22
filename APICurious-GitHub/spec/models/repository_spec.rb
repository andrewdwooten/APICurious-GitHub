require 'rails_helper'

describe Repository do
  describe '#count_of_starred' do
    it 'finds count of repositories starred by current_user' do
      VCR.use_cassette('models/repository/starred_count') do
        star_count = Repository.count_of_starred('andrewdwooten')

        expect(star_count).to eq(1)
      end
    end
  end
  describe '#repositories_by_name' do
    it 'finds names of all users repositories' do
      VCR.use_cassette('models/repository/repos_by_name') do
        repository_names = Repository.repositories_by_name('andrewdwooten')
        first_repo = repository_names.first


        expect(repository_names.count).to eq(28)
        expect(repository_names.class).to eq(Array)
        expect(first_repo.class).to eq(Hash)
        expect(first_repo.has_key?(:name)).to eq(true)
        expect(first_repo.has_key?(:url_ext)).to eq(true)
        expect(first_repo.has_key?(:updated_at)).to eq(true)
      end
    end
  end
end
