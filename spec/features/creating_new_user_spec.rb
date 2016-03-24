feature 'new user' do
  scenario 'allows a new user to sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Chris"
    expect(User.first.email).to eq "chris@gmail.com"
  end
end
