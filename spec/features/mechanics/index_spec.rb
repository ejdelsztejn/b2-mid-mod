require 'rails_helper'

RSpec.describe "mechanic index page", type: :feature do
  it 'can show all mechanics' do
    elitch_gardens = AmusementPark.create(name: "Elitch Gardens", admission_price: 65)
    six_flags = AmusementPark.create(name: "Six Flags New England", admission_price: 50)

    boomerang = elitch_gardens.rides.create(name: "Boomerang", thrill_rating: 8)
    half_pipe = elitch_gardens.rides.create(name: "Half Pipe", thrill_rating: 7)

    cyborg = six_flags.rides.create(name: "CYBORG Hyper Drive", thrill_rating: 9)
    thunderbolt = six_flags.rides.create(name: "Thunderbolt", thrill_rating: 5)

    chava = Mechanic.create(name: "Chava Martinez", years_of_experience: 16)
    leyzer = Mechanic.create(name: "Moyshe-Leyzer Ejdelsztejn", years_of_experience: 1)
    ayano = Mechanic.create(name: "Ayano Okamoto", years_of_experience: 18)
    majd = Mechanic.create(name: "Majd El-Masri", years_of_experience: 10)

    RideMechanic.create(ride_id: boomerang.id, mechanic_id: leyzer.id)
    RideMechanic.create(ride_id: boomerang.id, mechanic_id: ayano.id)
    RideMechanic.create(ride_id: cyborg.id, mechanic_id: chava.id)
    RideMechanic.create(ride_id: cyborg.id, mechanic_id: majd.id)

    visit "/mechanics"

    expect(page).to have_content("#{leyzer.name}")
    expect(page).to have_content("#{ayano.name}")
    expect(page).to have_content("#{chava.name}")
    expect(page).to have_content("#{majd.name}")

    expect(page).to have_content("#{leyzer.years_of_experience} years of experience")
    expect(page).to have_content("#{ayano.years_of_experience} years of experience")
    expect(page).to have_content("#{chava.years_of_experience} years of experience")
    expect(page).to have_content("#{majd.years_of_experience} years of experience")
    save_and_open_page
  end
end
