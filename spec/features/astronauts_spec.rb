require "rails_helper"

RSpec.describe "astronauts page", type: :feature do
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

  describe "as a visitor to the astronauts page" do
    it "shows a list of astronauts with information" do
      visit astronauts_path
      # binding.pry
      expect(page).to have_content("Name: Astronaut 1")
      expect(page).to have_content("Age: 34")
      expect(page).to have_content("Job: pilot")
      expect(page).to have_css(".astronaut-card", count: 6)

    end
  end

end
