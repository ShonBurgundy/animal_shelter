class AddAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table(:animals) do |t|
      t.string :dog
      t.string :cat

      t.timestamps()
    end
  end
end
