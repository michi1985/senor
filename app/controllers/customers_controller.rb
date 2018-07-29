class CustomersController < ApplicationController

  before_action :authenticate_user!

  def show
    @customer = Customer.find(params[:id])
    # @store = @customer.stores #indexのviewへ店舗一覧を渡す
  end

  def index
    # @customer = Customer.all
    @q = Customer.ransack(params[:q])
    @customer = @q.result(distinct: true)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "顧客を登録しました。"
      redirect_to @customer
    else
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params) #update_attributesはSaveもする
      flash[:success] = "顧客を更新しました。"
      redirect_to @customer
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id]).destroy
    flash[:success] = "顧客を削除しました。"
    redirect_to customers_url
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_name, :postal_code, :business, :prefectures, :city, :town_name, :phone_number, :fax_number, :url, :image)
  end

end
