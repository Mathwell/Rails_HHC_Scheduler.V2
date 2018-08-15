class Patient < ApplicationRecord
  has_many :visits
  belongs_to :nurse
  belongs_to :aid
end
