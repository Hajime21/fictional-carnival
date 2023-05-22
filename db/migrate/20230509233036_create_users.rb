class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :imie
      t.string :nazwisko
      t.string :pseudonim
      t.integer :wiek

      t.timestamps
    end
  end
end
