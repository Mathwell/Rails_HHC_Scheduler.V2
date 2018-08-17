class Patient < ApplicationRecord
  has_many :visits
  #has_many :nurses, :through => :visits
  belongs_to :nurse
end
