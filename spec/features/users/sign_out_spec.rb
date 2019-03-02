# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign out', :devise do
  scenario 'user signs out successfully' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
    click_link 'Logout'
    expect(page).to have_content I18n.t 'devise.sessions.signed_out'
  end
end
