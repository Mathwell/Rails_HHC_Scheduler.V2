class User < ActiveRecord::Base
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :username, :password, :email, presence: true

    has_secure_password
    has_many :rides
    has_many :attractions, :through => :rides

  def mood
    if self.happiness>self.nausea
      return "happy"
    else
      return "sad"
    end
  end

  def num_of_rides
  end

end
