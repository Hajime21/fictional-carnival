class User < ApplicationRecord
  def admin?
    admin
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :trainings#, dependent: :destroy gdyby byla potrzeba usuwania jego treningow razem z uzytkownikiem
end
#musze zrobic tak, zeby pseudonim imie nazwisko i wiek nie mogly byc null. edycja nastapila w registration_controller
