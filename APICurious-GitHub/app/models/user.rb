class User < ApplicationRecord

    def self.from_github(data, access_token)
      user           = User.find_or_create_by(uid: data["id"], provider: 'github')
      user.update_attributes(name:  data['login'],
                             token: access_token,
                             email: data['email'],
                             image: data['avatar_url'])
      user
    end

    def followers
      Follow.followers(self.name)
    end

    def following
      Follow.following(self.name)
    end

    def starred_count
      Repository.count_of_starred(self.name)
    end

    def recent_commits
      Commit.recent(self.name)
    end

end
