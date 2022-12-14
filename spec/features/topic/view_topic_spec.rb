require 'rails_helper'

feature 'view topics' do
  let (:topic) { create(:topic) }

  scenario 'see topics before sign in' do
    visit topic_path(topic)
    expect(page).to have_content topic.name
  end
end
