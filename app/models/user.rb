class User < ActiveRecord::Base
    
    validates :username, :presence => true
    validates :password, :presence => true
    validates :email, :presence => true,
    :uniqueness => true
    
    has_many :comments
    has_many :services
    has_secure_password
    
    def slug
        username.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
      User.all.find { |user| user.slug == slug }
    end

end


