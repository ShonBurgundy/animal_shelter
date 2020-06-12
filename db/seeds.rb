# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    Animal.delete_all
    seed = Seed.new
    seed.generate_animals
  end

  def generate_animals
    25.times do |i|
      animal = Animal.create!(
        species: Faker::Creature::Animal.name,
        name: Faker::DcComics.hero
      )
      puts "Animals #{i}: Animal: #{animal.species}, Name: #{animal.name}."
    end
  end
end

Seed.begin