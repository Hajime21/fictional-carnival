class UsersController < ApplicationController
  before_action :authenticate_user!
    def index
      @users = User.all
    end
    def show
      @user = User.find(params[:id])
      @trainings = @user.trainings
    end
    def training_history
      @user = current_user # Zakładając, że masz mechanizm uwierzytelniania i zalogowanego użytkownika
      @trainings = @user.trainings.order(data: :asc) # Pobranie ćwiczeń użytkownika posortowanych względem daty
  
      # Przygotowanie danych dla wykresu
      @dates = @trainings.pluck(:data) # Pobranie dat ćwiczeń
      @counts = @trainings.pluck(:liczba_pompek) # Pobranie liczby pompek dla każdego ćwiczenia
    end
    def weekly_ranking
      @users = User.joins(:trainings)
                 .where("trainings.data >= ?", 1.week.ago) # Pobierz treningi z ostatniego tygodnia
                 .group("users.id")
                 .select("users.*, SUM(trainings.liczba_pompek) AS total_pompek")
                 .order("total_pompek DESC")
                 .limit(5) # Ogranicz do 5 użytkowników
    end

    def monthly_ranking
      @users = User.joins(:trainings)
                   .where("trainings.data >= ?", 1.month.ago) # Pobierz treningi z ostatniego miesiąca
                   .group("users.id")
                   .order("COUNT(trainings.id) DESC")
                   .limit(3) # Ogranicz do 3 użytkowników
  
      # Możesz przekazać @users do widoku i wyświetlić ranking
    end
  end
