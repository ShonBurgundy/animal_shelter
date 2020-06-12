# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_animals
  end

  def generate_animals
    25.times do |i|
      animal = Animal.create!(
        dog: Faker::DcComics.hero,
        cat: Faker::Creature::Cat.name
      )
      puts "Animals #{i}: Dogs name: #{animal.dog}, Cats name: #{animal.cat}."
    end
  end
end

Seed.begin