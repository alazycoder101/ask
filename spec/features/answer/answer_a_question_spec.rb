require 'rails_helper'

feature 'Create question' do
  let (:user) { create(:user) }
  let (:question) { create(:question) }

  scenario 'Authenticated user answer a question' do
    login_as(user, :scope => :user, :run_callbacks => false)

    visit question_path(question)
    click_on 'answer'
    fill_in 'answer[body]', with: 'My answer body'

    click_on 'Submit'

    expect(page).to have_content 'My answer body'
  end

  scenario 'Non-authenticated user tries to create question' do
    visit question_path(question)
    expect(page).to_not have_link 'Ask a question'
  end
end
