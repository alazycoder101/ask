# frozen_string_literal: true
# https://stlcc.edu/student-support/academic-success-and-tutoring/writing-center/writing-resources/topic-ideas.aspx
topics = [
  {name: 'Education', description: 'Sex education, homeschooling, school bullying, non-smoking campus, learning disabilities, Common Core, affirmative action'},
  {name: 'Equality/Human Rights', description: 'Intolerance, hate groups, sexism/feminism, racism, religious freedom, criminal justice'},
  {name: 'Community/Social Issues', description: 'Urban/suburban/rural, St. Louis versus New Orleans, violence and gangs, The Gateway Arch/Forest Park, volunteerism, poverty, homelessness, materialism/consumer debt'},
  {name: 'Romantic Relationships', description: 'Romantic love, online dating, communication, domestic violence/abuse, marriage/divorce'},
  {name: 'Family/Friends', description: 'Parenting styles, mementos, unconditional love, personal boundaries, forgiveness'},
  {name: 'Recreation/Hobbies', description: 'Fly-fishing, rock climbing, video games/MMORPGs, NASCAR, casinos'},
  {name: 'Work', description: 'Networking, microlending, current or future job/career, customer service, labor unions, leadership'},
  {name: 'Identity/Appearance', description: 'Body modification, tattoo art, standards of beauty, fashion trends, retro styles'},
  {name: 'Food', description: 'Portion size, industrial agriculture, micro-brewed beers, organic food, genetically modified foods, heirloom seeds/gardening'},
  {name: 'Environmental Issues', description: '“Green” building, single-use plastics, alternative energy, climate change, national parks, biodiversity/extinction, animal rights'},
  {name: 'Technology', description: "Social networking sites, digital manipulation of photos, open source software, technology's effects on children's social skills, net neutrality, screen time"},
  {name: 'History', description: "Historical preservation, inventions, nonviolence/disobedience, Martin Luther King, Jr./Gandhi, women's rights/suffrage, World War II"},
  {name: 'Politics/Government', description: 'Political partisanship, terrorism, immigration, anarchy, helmet laws, protests'},
  {name: 'Sports', description: 'Snowboarding, professional sports, Baseball Hall of Fame, martial arts, stadiums'},
  {name: 'Health', description: 'Diseases and conditions, eating disorders, learning disorders, vaccines, health insurance, mental health'},
  {name: 'Transportation', description: 'Mass transit/buses, bicycling, MetroLink/Trains, alternative fuels, Electric/Hybrid cars'},
  {name: 'Arts/Entertainment/Media', description: 'Alternative/Punk/Rap music, reality TV, performance artists, cult/classic movies, celebrity culture, animé'},
  {name: 'Values', description: 'Competition, duty/obligation, persistence/determination, creativity, resilience/perseverance, heroes'}
]

if Rails.env.development?
  Topic.insert_all(topics)
end

