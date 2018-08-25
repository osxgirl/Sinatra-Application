class User < ActiveRecord::Base
    has_many :comments
    has_many :services
    has_secure_password
    
    def slug
        self.username.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
      self.all.find { |instance| instance.slug == slug }
    end

end


