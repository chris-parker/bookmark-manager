

feature 'Add link to BOOKMARKS' do
  scenario 'Click Add Link and submit' do
    visit '/home'
    click_button("Add Link")
    fill_in('title', with: 'NME')
    fill_in('href', with: 'http://www.nme.com' )
    fill_in('tags', with: 'news, music')
    click_button("Save")

    visit '/home'
    click_button("Add Link")
    fill_in('title', with: 'Melody Maker')
    fill_in('href', with: 'http://www.melody_maker.com' )
    fill_in('tags', with: 'bubbles')
    click_button("Save")

    visit '/home'
    click_button("Add Link")
    fill_in('title', with: 'Smash Hits')
    fill_in('href', with: 'http://www.smash.com' )
    fill_in('tags', with: 'bubbles')
    click_button("Save")

    link = Link.all
    expect(page).to have_link 'Melody Maker'
    expect(link.tags.map(&:name)).to include('news')
    expect(link.tags.map(&:name)).to include('music')

  end
end
