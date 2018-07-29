class StoresController < ApplicationController

    before_action :authenticate_user!, :set_customer, except: [:index]

    def show
      @store = Store.find(params[:id])
      # @ticket = @store.tickets  #indexのviewへインシデント一覧を渡す
    end

    def index
      # @store = Store.all
      @q = Store.ransack(params[:q])
      @store = @q.result(distinct: true).order("customer_id desc")
    end

    def new
      @store = @customer.stores.build
    end

    def create
      @store = @customer.stores.build(store_params)
      if @store.save
        flash[:success] = "店舗を登録しました。"
        redirect_to [@customer, @store]
      else
        render :new
      end
    end

    def edit
      @store = Store.find(params[:id])
    end

    def update
      @store = @customer.stores.find(params[:id])
      if @store.update_attributes(store_params) #update_attributesはSaveもする
        flash[:success] = "店舗を更新しました。"
        redirect_to [@customer, @store]
      else
        render :edit
      end
    end

    def destroy
      @store = Store.find(params[:id]).destroy
      flash[:success] = "店舗を削除しました。"
      redirect_to @store
    end

    private

    def store_params
      params.require(:store).permit(:store_code, :store_name, :postal_code, :prefectures, :city, :town_name, :phone_number, :fax_number, :business_hours_start, :business_hours_end, :pos_type, :ip_address, :remarks)
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end
end
