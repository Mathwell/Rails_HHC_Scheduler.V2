class Visit < ApplicationRecord
  validates :nurse_id, :patient_id, :date, presence: true
  belongs_to :patient
  belongs_to :nurse

end
