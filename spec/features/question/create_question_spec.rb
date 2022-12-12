require 'rails_helper'

feature 'Create question' do
  let (:user) { create(:user) }

  scenario 'Authenticated user creates a question' do
    login_as(user)

    visit questions_path
    click_on 'Ask a question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'My awesome question body'
    click_on 'Create'

    expect(page).to have_content 'Question was successfully created.'
  end

  scenario 'Non-authenticated user tries to create question' do
    visit questions_path
    expect(page).to_not have_link 'Ask a question'
  end
end
