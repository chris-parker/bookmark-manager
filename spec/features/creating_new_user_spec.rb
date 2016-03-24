feature 'new user' do
  scenario 'allows a new user to sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Chris"
    expect(User.first.email).to eq "chris@gmail.com"
  end
end

feature 'new user incorrect password verification' do
  scenario 'does not create a new user' do
    expect { incorrect_sign_up }.not_to change(User, :count)
    # expect { incorrect_sign_up }.to raise_error("Password does not match")
  end
end
