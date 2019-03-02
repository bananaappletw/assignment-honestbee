# Feature: Sign up
#   As a visitor
#   I want to sign up
#   So I can visit protected areas of the site
feature 'Sign Up', :devise do
  scenario 'visitor can sign up with valid email address and password' do
    visit new_user_registration_path
    email = 'new@gmail.com'
    password = 'newnew'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button 'Sign up'
    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
  end
end
