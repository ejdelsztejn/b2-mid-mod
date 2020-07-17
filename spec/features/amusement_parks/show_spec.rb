require 'rails_helper'

RSpec.describe "amusement park show page", type: :feature do
  it 'can display information about a given amusement park' do
    elitch_gardens = AmusementPark.create(name: "Elitch Gardens", admission_price: 65)

    boomerang = elitch_gardens.rides.create(name: "Boomerang", thrill_rating: 8)
    half_pipe = elitch_gardens.rides.create(name: "Half Pipe", thrill_rating: 7)
    tower_of_doom = elitch_gardens.rides.create(name: "Tower of Doom", thrill_rating: 10)

    visit "/amusement_parks/#{elitch_gardens.id}"

    expect(page).to have_content("#{elitch_gardens.name}")
    expect(page).to have_content("Admissions: $#{elitch_gardens.admission_price}.00")

    expect(page).to have_content("Rides:")
    expect(page).to have_content("#{boomerang.name}")
    expect(page).to have_content("#{half_pipe.name}")
    expect(page).to have_content("#{tower_of_doom.name}")
    expect(page).to have_content("Average Thrill Rating of Rides: 8.3/10")
  end
end
