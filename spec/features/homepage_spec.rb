require 'rails_helper'

RSpec.feature "Homepages", type: :feature do
  describe 'homepage' do
    it 'show underline' do
      visit '/'

      expect(page).to have_content('Home#index')
    end
  end
end
