class AddSizeAgeToHussar < ActiveRecord::Migration
  def change
    add_column :hussars, :size, :integer
    add_column :hussars, :age, :integer
    add_column :hussars, :gender, :boolean
  end
end
