require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  it 'renders product' do
    product = assign(:product, FactoryBot.create(:product))
    render
    expect(rendered).to match(product.name)
    expect(rendered).to match(product.price.to_s)
  end
end
