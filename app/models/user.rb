class User < ActiveRecord::Base
    has_secure_password
<<<<<<< HEAD
    validates :password, :presence => true
    validates :email, :presence => true,
    :uniqueness => true
    has_many :posts
end


def self.find_by_slug(slug)
        User.all.find { |user| user.slug == slug }
end
=======
    validates :email, :presence => true
    has_many :posts
end
>>>>>>> fa78820d2fa12007ac2098212e63607e286fad2e
