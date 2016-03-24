def sign_up
  visit '/new_user'
  fill_in :username, with: "Chris"
  fill_in :email, with: "chris@gmail.com"
  fill_in :password, with: "notmypassword"
  click_button "Submit"
end
