class CreateHussars < ActiveRecord::Migration
  def change
    create_table :hussars do |t|
      t.string :name
      t.date :born

      t.timestamps null: false
    end
  end
end
