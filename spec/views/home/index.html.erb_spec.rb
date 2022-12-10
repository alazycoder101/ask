require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it 'display text' do
    render
    rendered.should include('Home')
  end
end
