

feature 'Add link to BOOKMARKS' do
  scenario 'Click Add Link and submit' do
    visit '/home'
    click_button("Add Link")
    fill_in('title', with: 'NME')
    fill_in('href', with: 'http://www.nme.com' )
    fill_in('tags', with: 'news')
    click_button("Save")

    visit '/home'
    click_button("Add Link")
    fill_in('title', with: 'Melody Maker')
    fill_in('href', with: 'http://www.melody_maker.com' )
    fill_in('tags', with: 'bubbles')
    click_button("Save")

    visit '/tags/bubbles'

    expect(page).not_to have_link 'NME'
    expect(page).to have_link 'Melody Maker'
  end
end
