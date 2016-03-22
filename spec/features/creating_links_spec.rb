feature 'creating links' do
  scenario 'allows a user to create a link with title and url' do
    visit 'links/new'
    fill_in :title, with: "Google"
    fill_in :url, with: "www.google.com"
    click_button "Submit"

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content "Google"
    end
  end
end
