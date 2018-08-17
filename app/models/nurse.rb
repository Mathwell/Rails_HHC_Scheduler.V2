class Nurse < ApplicationRecord
  #has_many :visits
  has_many :patients
  #, :through => :visits

  def name
    return self.first_name+" "+self.last_name
  end
end
