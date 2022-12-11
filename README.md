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
* Comment: acts_as_commentable https://github.com/alazycoder101/acts_as_commentable
* Vote: Votable
* pagination: kaminari
* Tailwind: styling
* pg_search: global text search

## Development
### Gems
* Rspec
* Rubocop
* Capybara


### Setup
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


# Further development
## styling
With more understanding about tailwind, the styling should be improved.

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
