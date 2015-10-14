class AddSizeAgeToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :size, :integer
    add_column :horses, :age, :integer
    add_column :horses, :gender, :boolean
  end
end
