class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.date :data
      t.integer :liczba_pompek
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
