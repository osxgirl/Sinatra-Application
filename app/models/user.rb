class User < ActiveRecord::Base
    validates_presence_of :username, :password
    
    has_many :comments
    has_many :services
    has_secure_password
    #encrypt bcrypt server Auths
    
    def slug
        username.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
      User.all.find { |user| user.slug == slug }
    end

end


