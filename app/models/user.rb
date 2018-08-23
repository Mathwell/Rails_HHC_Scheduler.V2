class User < ActiveRecord::Base
    #validates :email, uniqueness: true
    #validates :username, uniqueness: true
    #validates :username, :password, :email, presence: true

    has_secure_password



end
