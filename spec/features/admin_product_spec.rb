RSpec.feature 'Product', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:admin)
    login_as(@user, scope: :user)
  end

  scenario 'Admin user can create product' do
    product = FactoryBot.build(:product)
    visit new_admin_product_path
    fill_in 'product_name', with: product.name
    fill_in 'product_price', with: product.price
    fill_in 'product_premium_price', with: product.premium_price
    attach_file 'product_images', [file_fixture('cat.jpg'), file_fixture('explosion.jpg')]
    click_button 'Create Product'
    expect(page).to have_text('Product was successfully created.')
    expect(page).to have_text(product.name)
    expect(page).to have_text(product.price)
    expect(page).to have_text(product.premium_price)
    product.images do |image|
      expect(page).to have_text(image.filename)
    end
  end

  scenario 'Admin user can view product' do
    product = FactoryBot.create(:product)
    visit admin_product_path(product)
    expect(page).to have_text(product.name)
    expect(page).to have_text(product.price)
    expect(page).to have_text(product.premium_price)
    product.images do |image|
      expect(page).to have_text(image.filename)
    end
  end

  scenario 'Admin user can edit product' do
    product1 = FactoryBot.create(:product)
    product2 = FactoryBot.build(:product)
    visit edit_admin_product_path(product1)
    fill_in 'product_name', with: product2.name
    fill_in 'product_price', with: product2.price
    fill_in 'product_premium_price', with: product2.premium_price
    attach_file 'product_images', [file_fixture('scare.jpg')]
    click_button 'Update Product'
    expect(page).to have_text(product2.name)
    expect(page).to have_text(product2.price)
    expect(page).to have_text(product2.premium_price)
    product2.images do |image|
      expect(page).to have_text(image.filename)
    end
  end

  scenario 'Admin user can delete product' do
    product = FactoryBot.create(:product)
    visit edit_admin_product_path(product)
    click_button 'Destroy'
    expect(page).to have_text('Product was successfully destroyed.')
  end
end
