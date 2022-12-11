# Ask: Question Answer System

## Functions

1. User can register, ask and answer quetions.

2. Implement a voting system that allows users to upvote or downvote questions and answers.

3. User can search for specific questions or answers.

4. Questions can be tagged and categorized.

5. User can get suggestions for existing questions.

6. User can be rewarded with more upvote.

7. Admin can review and flag inappropriate content.

### Good to Have
1. User invite to answer
2. omniauth
3. Soft delete

## Tech Options
### Database
* PostgreSQL
* MongoDB

### Front End
* React
* StimulusJS

### Backend
* Rails

## Functions
* Authentication: devise
* Authorization: pundit
* slug: FriendlyId
* Admin: ActiveAdmin
* Comment: Commentable
* Vote: Votable


## Development
### Setup
```bash
# 
brew install ruby
brew install asdf

# add install
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.bash_profile

# bundler
gem install bundle
bundle install

# setup database
bin/rails db:create
bin/rails db:migrate

# run the server
bin/dev 
# goto http://0.0.0.0:3000
```

### Gems
* Rspec
* Rubocop
* Capybara
* Tailwind

Please go here to check more details
Rails project with tailwind: https://github.com/alazycoder101/rails-tailwind




