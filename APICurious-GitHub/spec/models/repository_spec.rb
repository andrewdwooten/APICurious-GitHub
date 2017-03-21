require 'rails_helper'

describe Repository do
  describe '#count_of_starred' do
    it 'finds count of repositories starred by current_user' do
      star_count = Repository.count_of_starred('andrewdwooten')

      expect(star_count).to eq(1)
    end
  end
end
