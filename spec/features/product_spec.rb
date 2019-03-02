RSpec.feature 'Product', type: :feature do
  scenario 'User can view products' do
    products = FactoryBot.create_list(:product, 3)
    visit products_path
    products.each do |product|
      expect(page).to have_text(product.name)
      expect(page).to have_text(product.price)
      product.images do |image|
        expect(page).to have_text(image.filename)
      end
    end
  end

  scenario 'User can view product' do
    product = FactoryBot.create(:product)
    visit product_path(product)
    expect(page).to have_text(product.name)
    expect(page).to have_text(product.price)
    product.images do |image|
      expect(page).to have_text(image.filename)
    end
  end

  scenario 'Premium user can view premium price of product' do
    user = FactoryBot.create(:premium)
    login_as(user, scope: :user)
    product = FactoryBot.create(:product)
    visit product_path(product)
    expect(page).to have_text(product.name)
    expect(page).to have_text(product.price)
    expect(page).to have_text(product.premium_price)
    product.images do |image|
      expect(page).to have_text(image.filename)
    end
  end
end
