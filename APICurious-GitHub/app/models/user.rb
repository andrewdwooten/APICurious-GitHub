class User < ApplicationRecord

    def self.from_github(data, access_token)
      user           = User.find_or_create_by(uid: data["id"], provider: 'github')
      user.update_attributes(name:  data['login'],
                             token: access_token,
                             email: data['email'],
                             image: data['avatar_url'])
      user
    end

end
