class Visit < ApplicationRecord
  validates :nurse_id, :patient_id, :date, presence: true
 validates :nurse_id, :patient_id, length: { minimum: 1 }
  belongs_to :patient
  belongs_to :nurse

end
