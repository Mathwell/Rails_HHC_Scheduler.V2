class Nurse < ApplicationRecord
  has_many :visits
  has_many :patients
  #, :through => :visits

  def name
    return self.first_name+" "+self.last_name
  end

  def patient_count
    return self.patients.count
  end
end
