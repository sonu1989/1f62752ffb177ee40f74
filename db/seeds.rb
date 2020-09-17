# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CHANNELS = ['DD News',
  'Republic Bharat', 
  'NDTV', 
  'Aaj Tak', 
  'Colours', 
  'Sony TV', 
  'Zee News', 
  'ABP News'
]

TV_SHOWS= ['The West Wing',
  'The Simpsons',
  'I Love Lucy',
  'Breaking Bad',
  'The Dick Van Dyke Show',
  'Hill Street Blues',
  'Arrested Development',
  'The Daily Show with Jon Stewart',
  'Six Feet Under',
  'Taxi',
  'The Larry Sanders Show',
  '30 Rock'
]

MINUTES = [00,05,10,15,20,25,30,35,40,45,50,55]

CHANNELS.each do |channel_name|
  channel = Channel.find_or_initialize_by(name: channel_name)
  if channel.save
    (1..10).to_a.each do |i|
      show_name = TV_SHOWS[rand(0...(TV_SHOWS.size-1))]
      show_time = "#{rand(0...23)}:#{MINUTES[rand(0...(MINUTES.size-1))]}"
      channel.tv_shows.create(name: show_name, timing: show_time)
    end
  end
end
