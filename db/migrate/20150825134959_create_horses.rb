class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.belongs_to :hussar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
