# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# In your db/seeds.rb file

tech_movies = [
  {
    name: 'The Social Network 2',
    actor: 'Jesse Eisenberg',
    price: 50.00,
    producer: 'Scott Rudin',
    net_worth: '50000000',
    release_year: '2010',
    starts_at: DateTime.new(2024, 10, 10, 8, 0, 0),
    description:
      'The story of how Mark Zuckerberg created Facebook, and the ensuing legal battles.',
  },
  {
    name: 'The Matrix 4',
    actor: 'Keanu Reeves',
    price: 75.00,
    producer: 'Joel Silver',
    net_worth: '100000000',
    release_year: '1999',
    starts_at: DateTime.new(2024, 12, 31, 8, 0, 0),
    description:
      'A computer hacker learns about the true nature of his reality and his role in the war against its controllers.',
  },
  {
    name: 'Blade Runner 2049',
    actor: 'Ryan Gosling',
    price: 90.00,
    producer: 'Andrew A. Kosove',
    net_worth: '200000000',
    release_year: '2017',
    starts_at: DateTime.new(2017, 10, 6, 8, 0, 0),
    description:
      "A young blade runner uncovers a secret that could plunge what's left of society into chaos.",
  },
  {
    name: 'Ex Machina',
    actor: 'Domhnall Gleeson',
    price: 60.00,
    producer: 'Andrew Macdonald',
    net_worth: '15000000',
    release_year: '2014',
    starts_at: DateTime.new(2014, 4, 10, 8, 0, 0),
    description:
      'A young programmer is selected to participate in a ground-breaking experiment in synthetic intelligence by evaluating the human qualities of a highly advanced humanoid A.I.',
  },
  {
    name: 'Her 4',
    actor: 'Joaquin Phoenix',
    price: 70.00,
    producer: 'Megan Ellison',
    net_worth: '30000000',
    release_year: '2013',
    starts_at: DateTime.new(2025, 12, 18, 8, 0, 0),
    description:
      'In a near future, a lonely writer develops an unlikely relationship with an operating system designed to meet his every need.',
  },
  {
    name: 'Iron Man 5',
    actor: 'Robert Downey Jr.',
    price: 100.00,
    producer: 'Kevin Feige',
    net_worth: '140000000',
    release_year: '2008',
    starts_at: DateTime.new(2024, 10, 10, 8, 0, 0),
    description:
      'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.',
  },
  {
    name: 'Ghost in the Shell',
    actor: 'Scarlett Johansson',
    price: 85.00,
    producer: 'Avi Arad',
    net_worth: '110000000',
    release_year: '2017',
    starts_at: DateTime.new(2017, 3, 31, 8, 0, 0),
    description:
      'In the near future, Major is the first of her kind: A human saved from a terrible crash, who is cyber-enhanced to be a perfect soldier devoted to stopping the world’s most dangerous criminals.',
  },
  {
    name: 'Minority Report',
    actor: 'Tom Cruise',
    price: 95.00,
    producer: 'Bonnie Curtis',
    net_worth: '102000000',
    release_year: '2002',
    starts_at: DateTime.new(2002, 6, 21, 8, 0, 0),
    description:
      'In a future where a special police unit is able to arrest murderers before they commit their crimes, an officer from that unit is himself accused of a future murder.',
  },
  {
    name: 'Tron: Legacy',
    actor: 'Garrett Hedlund',
    price: 80.00,
    producer: 'Sean Bailey',
    net_worth: '170000000',
    release_year: '2010',
    starts_at: DateTime.new(2010, 12, 17, 8, 0, 0),
    description:
      'The son of a virtual world designer goes looking for his father and ends up inside the digital world that his father designed.',
  },
  {
    name: 'WarGames',
    actor: 'Matthew Broderick',
    price: 65.00,
    producer: 'Lawrence Lasker',
    net_worth: '12000000',
    release_year: '1983',
    starts_at: DateTime.new(1983, 6, 3, 8, 0, 0),
    description:
      'A young man finds a back door into a military central computer in which reality is confused with game-playing, possibly starting World War III.',
  },
  {
    name: 'Hackers',
    actor: 'Jonny Lee Miller',
    price: 60.00,
    producer: 'Rafael Moreu',
    net_worth: '20000000',
    release_year: '1995',
    starts_at: DateTime.new(1995, 9, 15, 8, 0, 0),
    description:
      'A young boy is arrested by the U.S. Secret Service for writing a computer virus and is banned from using a computer until he is 18.',
  },
]

tech_movies.each do |movie|
  Movie.create!(
    name: movie[:name],
    actor: movie[:actor],
    price: movie[:price],
    producer: movie[:producer],
    net_worth: movie[:net_worth],
    release_year: movie[:release_year],
    starts_at: movie[:starts_at],
    description: movie[:description],
  )
end
