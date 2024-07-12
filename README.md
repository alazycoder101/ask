# Ask: Question Answer System

## Functions

1. User can register, ask and answer quetions.

2. Implement a voting system that allows users to upvote or downvote questions and answers.

3. User can search for specific questions or answers.

4. User can follow other users, questions and topics.

5. Questions can be tagged and categorized into topics.

6. User can get suggestions for existing questions. (not yet)

7. User can be rewarded with more upvote. (not yet)

8. Admin can review and flag inappropriate content. (not yet)

### Good to Have
1. User invite to answer
2. omniauth
3. Soft delete
4. Audit logs
5. Spam check
6. Mute
7. Share question to social media
8. Notification and Emails
9. Specify user to answer questions


## Tech Options
### Database
* PostgreSQL: very popular RDBMS
* MongoDB: easy to expand and change and distributed support, but not good for join operations

### Front End
* React
* StimulusJS (chosen)
* Turbolink

### Backend
* Rails

## Functions
* Authentication: [devise](https://github.com/heartcombo/devise)
* Authorization: [pundit](https://github.com/varvet/pundit)
* slug: FriendlyId
* Admin: ActiveAdmin
* Comment: [acts_as_commentable](https://github.com/alazycoder101/acts_as_commentable)
* Vote: [Acts As Votable](https://github.com/ryanto/acts_as_votableVotable)
* pagination: [kaminari](https://github.com/kaminari/kaminari)
* Tailwind: styling
* [pg_search](https://github.com/Casecommons/pg_search): global text search

## Development
### Gems
* Rspec
* Rubocop
* Capybara
* Cypress fast

* Circle CI
* Travis
* Git Action
* Jenkins

### Docker

```bash
# install docker
brew install docker
```
(more...)[https://docs.docker.com/desktop/install/mac-install/]

```bash
cd docker
docker compose build web
docker compose run --rm web bin/rails db:create db:migrate db:seed
docker compose up web
# goto http://0.0.0.0:8081
```

### Setup on Mac
```bash
# Ruby
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

bin/rails db:seed

# replant seed
bin/rails db:seed:replant

# run the server
bin/dev 
# goto http://0.0.0.0:3000
```

Please go here to check more details
Rails project with tailwind: https://github.com/alazycoder101/rails-tailwind

### Tips

<<<<<<< HEAD
## Test

```
yarn add cypress --dev
yarn cypress open

```

```yaml
gem 'cypress-on-rails', '~> 1.0'
```

`bin/rails g cypress_on_rails:install`

```bash

DISABLE_HEADLESS=1 bin/rspec spec/features/user/signin_spec.rb
```

# Further development
## styling
With more understanding about tailwind, the styling should be improved.

### After Thoughts
1. It's really difficult debug tailwind before fully master it.
2. Should have focused on core function first before expanding to other
   functions.
3. Not enough tests to cover all the code.
4. turbolink + stimulus is confusing sometimes.

## performance
### Cache
1. cache columns for votable

For like and dislike
```ruby
class AddCachedVotesAnswers < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :cached_votes_total, default: 0
      t.integer :cached_votes_score, default: 0
      t.integer :cached_votes_up, default: 0
      t.integer :cached_votes_down, default: 0
      t.integer :cached_weighted_score, default: 0
      t.integer :cached_weighted_total, default: 0
      t.float :cached_weighted_average, default: 0.0
    end

    # Uncomment this line to force caching of existing votes
    # Post.find_each(&:update_cached_votes)
  end
end
```

For followers
```ruby
class AddCachedVotesToQuestions < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :cached_scoped_follow_votes_total, default: 0
      t.integer :cached_scoped_follow_votes_score, default: 0
      t.integer :cached_scoped_follow_votes_up, default: 0
      t.integer :cached_scoped_follow_votes_down, default: 0
      t.integer :cached_weighted_follow_score, default: 0
      t.integer :cached_weighted_follow_total, default: 0
      t.float :cached_weighted_follow_average, default: 0.0

      # Uncomment this line to force caching of existing scoped votes
      # Post.find_each { |p| p.update_cached_votes("subscribe") }
    end
  end
end
```

#### Redis
Cache search result into Redis to speed up the query and free the
pressure to database.
