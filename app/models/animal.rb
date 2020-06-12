class Animal < ApplicationRecord
  validates_presence_of :species
  validates_presence_of :name
end