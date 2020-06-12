class Animal < ApplicationRecord
  validates_presence_of :species
  validates_presence_of :name

  scope :search_animal, -> (species) {where(species: species)}

  def self.search(srch_value)
    search_animal(srch_value)
  end
end