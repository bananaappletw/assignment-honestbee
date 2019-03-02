require 'rails_helper'

RSpec.describe 'admin/products/edit', type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(:product))
  end

  it 'renders the edit admin_product form' do
    render

    assert_select 'form[action=?][method=?]', admin_product_path(@product), 'post' do
      assert_select 'input[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[price]'

      assert_select 'input[name=?]', 'product[premium_price]'
    end
  end
end
