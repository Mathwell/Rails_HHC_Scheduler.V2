class Patient < ApplicationRecord
  validate :is_title_case
  before_validation :make_title_case
  validates :last_name, :first_name, presence: true
  validates :last_name, :first_name, length: { minimum: 2 }
  has_many :visits
  #has_many :nurses, :through => :visits
  belongs_to :nurse
  #has_many :aids, :through => :visits

  def name
    return self.first_name+" "+self.last_name
  end

  private

   def is_title_case
     if first_name.split.any?{|w|w[0].upcase != w[0]}
       errors.add(:first_name, "First name must be in title case")
     end

     if last_name.split.any?{|w|w[0].upcase != w[0]}
       errors.add(:last_name, "Last name must be in title case")
     end

   end

   def make_title_case
     self.first_name = self.first_name.titlecase
     self.last_name = self.last_name.titlecase
   end
end
