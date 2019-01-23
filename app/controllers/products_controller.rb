class ProductsController < ApplicationController
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index; end

  # GET /products/1
  # GET /products/1.json
  def show; end
end
