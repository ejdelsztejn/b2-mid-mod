require 'rails_helper'

RSpec.describe "mechanic show page", type: :feature do
   it 'can display information about a given mechanic' do
    elitch_gardens = AmusementPark.create(name: "Elitch Gardens", admission_price: 65)
    six_flags = AmusementPark.create(name: "Six Flags New England", admission_price: 50)

    boomerang = elitch_gardens.rides.create(name: "Boomerang", thrill_rating: 8)
    half_pipe = elitch_gardens.rides.create(name: "Half Pipe", thrill_rating: 7)

    cyborg = six_flags.rides.create(name: "CYBORG Hyper Drive", thrill_rating: 9)
    thunderbolt = six_flags.rides.create(name: "Thunderbolt", thrill_rating: 5)

    ayano = Mechanic.create(name: "Ayano Okamoto", years_of_experience: 18)

    RideMechanic.create(ride_id: half_pipe.id, mechanic_id: ayano.id)
    RideMechanic.create(ride_id: boomerang.id, mechanic_id: ayano.id)

    visit "/mechanics/#{ayano.id}"

    expect(page).to have_content("Mechanic: #{ayano.name}")
    expect(page).to have_content("Years of Experience: #{ayano.years_of_experience}")
    expect(page).to have_content("Current rides they’re working on:")
    expect(page).to have_content("#{boomerang.name}")
    expect(page).to have_content("#{half_pipe.name}")

    expect(page).to have_content("Add a ride to workload:")

    fill_in "Ride ID", with: cyborg.id

    click_on "Submit Ride"

    expect(current_path).to eq("/mechanics/#{ayano.id}")
    xpect(page).to have_content("#{cyborg.name}")
  end
end
