feature 'View list of links' do
  scenario 'User sees a list of links on homepage' do
    Link.create title: "Makers Academy", url: "www.makersacademy.com"
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
