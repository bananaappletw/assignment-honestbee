# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do
  scenario 'user can sign in with valid credentials' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end
end
