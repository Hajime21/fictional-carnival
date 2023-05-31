class Training < ApplicationRecord
  validate :valid_date

  def valid_date
    if data.present? && data > Date.current
      errors.add(:data, "Nie możesz dodawać treningów na przyszłe dni.")
    end
  end
  
  belongs_to :user
  validates :data, presence: true
  validates :data, uniqueness: { scope: :user_id, message: 'Możesz dodać tylko jeden trening danego dnia.' }
end
