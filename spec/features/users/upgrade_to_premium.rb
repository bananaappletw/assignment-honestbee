# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do
  scenario 'user can sign in with valid credentials' do
    user = FactoryBot.create(:user)
    visit edit_user_registration_path
    check 'user_premium'
    click_button 'Update'
    expect(user.has_role(:premium)).to be true
  end
end
