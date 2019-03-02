require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  it 'renders a list of products' do
    @products = assign(:products, FactoryBot.create_list(:product, 3))
    render
    @products.each do |product|
      expect(rendered).to match(product.name)
      expect(rendered).to match(product.price.to_s)
    end
  end
end
