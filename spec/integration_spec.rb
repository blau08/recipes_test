require('spec_helper')
require('capybara/rspec')
require("./app")
Capybara.app = Sinatra::Application

describe('/recipes', {type: :feature}) do
  it('displays a list of recipes') do
    visit('/')
    click_link("recipes")
    expect(page).to have_content("recipe")
  end
end
