require 'rails_helper'

describe Astronaut, type: :model do
  before :each do
    @mission2 = Mission.create(title: "Apollo 2", time_in_space: 2000)
    @mission3 = Mission.create(title: "Apollo 3", time_in_space: 3000)
    @mission4 = Mission.create(title: "Apollo 4", time_in_space: 4000)
    @astro1 = @mission2.astronauts.create(name: "Astronaut 1", age: 34,job: "pilot")
    @astro2 = @mission2.astronauts.create(name: "Astronaut 2", age: 35,job: "scientist")
    @astro3 = @mission2.astronauts.create(name: "Astronaut 3", age: 36,job: "navigator")
    @astro4 = @mission3.astronauts.create(name: "Astronaut 4", age: 32,job: "pilot")
    @astro5 = @mission4.astronauts.create(name: "Astronaut 5", age: 31,job: "navigator")
    @astro6 = @mission4.astronauts.create(name: "Astronaut 6", age: 30,job: "scientist")

    @astro1.missions << @mission4
    @astro2.missions << @mission3
    @astro4.missions << @mission3
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe ".average_age" do
    expect(Astronaut.average_age).to eq(33)
  end
end
