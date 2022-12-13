require 'rails_helper'

feature 'Create question' do
  let (:user) { create(:user) }

  scenario 'Authenticated user creates a question' do
    login_as(user, :scope => :user, :run_callbacks => false)

    visit questions_path
    click_on 'Ask a question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'My awesome question body'
    click_on 'Submit'

    expect(page).to have_content 'Question is created.'
  end

  scenario 'Authenticated user creates a duplicate question' do
    login_as(user, :scope => :user, :run_callbacks => false)

    question = create(:question, title: 'Test question')

    visit questions_path
    click_on 'Ask a question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'My awesome question body'
    click_on 'Submit'

    expect(page.current_path).to eq "/questions/#{question.id}"
  end

  scenario 'Non-authenticated user tries to create question' do
    visit questions_path
    expect(page).to_not have_link 'Ask a question'
  end
end
