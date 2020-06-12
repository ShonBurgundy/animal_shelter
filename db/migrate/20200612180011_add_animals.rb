class AddAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table(:animals) do |t|
      t.string :species
      t.string :name

      t.timestamps()
    end
  end
end
