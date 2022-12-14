require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it 'display text' do
    assign(:users, [])
    assign(:questions, [])
    render
    rendered.should include('No results')
  end
end
