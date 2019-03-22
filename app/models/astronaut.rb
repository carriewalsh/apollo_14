class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    average(:age)
  end

  def self.ordered_missions(astronaut)
    Astronaut.find(astronaut.id).missions.name.sort
  end
end
