require 'rails_helper'

RSpec.describe 'admin/products/new', type: :view do
  before(:each) do
    assign(:product, FactoryBot.build(:product))
  end

  it 'renders new product form' do
    render
    assert_select 'form[action=?][method=?]', admin_products_path, 'post' do
      assert_select 'input[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[price]'

      assert_select 'input[name=?]', 'product[premium_price]'
    end
  end
end
