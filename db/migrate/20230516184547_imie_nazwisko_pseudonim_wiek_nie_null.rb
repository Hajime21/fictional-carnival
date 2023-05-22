class ImieNazwiskoPseudonimWiekNieNull < ActiveRecord::Migration[7.0]
    def change
      change_column_null :users, :imie, false
      change_column_null :users, :nazwisko, false
      change_column_null :users, :pseudonim, false
      change_column_null :users, :wiek, false
    end
  end
