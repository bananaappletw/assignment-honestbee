class ProductsController < ApplicationController
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index; end

  # GET /products/1
  # GET /products/1.json
  def show; end

  # GET /products/new
  def new; end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create; end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update; end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy; end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:price, :name, images: [])
  end
end
