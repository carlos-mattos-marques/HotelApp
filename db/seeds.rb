require 'ffaker'

Hotel.create([
  { name: "Comfort Inn & Suites Market Ctr", location: "7138 N Stemmons Fwy, Dallas, TX, 75247" },
  { name: "Hilton Anatole", location: "2201 Stemmons Freeway, Dallas, TX, 75207" },
  { name: "Hotel ZaZa", location: "2332 Leonard St, Dallas, TX, 75201" },
  { name: "The Stoneleigh Hotel & Spa", location: "2927 Maple Ave, Dallas, TX, 75201" },
  { name: "Crap Hotel", location: "123 N Main St, Dallas, TX, 75201" },
  { name: "Hotel Indigo Test Hotel", location: "1933 Main St, Dallas, TX, 75201" },
  { name: "Renaissance Dallas Addison", location: "15201 Dallas Parkway, Dallas, TX, 75001" },
  { name: "Dallas Symphony Orchestra", location: "2301 Flora Street, Dallas, TX, 75201" },
  { name: "Warwick Melrose Hotel Dallas - Demo", location: "3015 Oak Lawn Avenue, Dallas, TX, 75219" },
  { name: "Econo Lodge Airport I-35 North Hotel", location: "2275 Valley View Lane, Dallas, TX, 75234" },
])

Hotel.find_each do |hotel|
  hotel.room_types.create(rand(1..10).times.map { { name: FFaker::Address.unique.secondary_address, available: [true, false].sample } })
end
