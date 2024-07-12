require 'rails_helper'

RSpec.feature "Homepages", type: :feature do
  describe 'homepage' do
    it 'show topbar' do
      visit '/'

      expect(page).to have_content('Ask Topics Questions')
    end
  end
end
